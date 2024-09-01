import 'package:eventos/features/create_event/data/models/create_event_model.dart';
import 'package:eventos/features/home/data/repos/home_repo_impl.dart';
import 'package:eventos/features/home/presentation/view_models/events_category_cubit/events_category_cubit.dart';
import 'package:eventos/features/home/presentation/view_models/service_categories_cubit/service_categories_cubit.dart';
import 'package:eventos/features/home/presentation/view_models/service_providers_cubit/service_providers_cubit.dart';
import 'package:eventos/features/home/presentation/view_models/venue_cubit/venue_cubit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eventos/core/utils/constants/sizes.dart';
import 'package:eventos/features/create_event/presentation/views/second_step_screen.dart';
import 'package:eventos/features/create_event/presentation/view_models/cubit/create_event_cubit.dart';
import 'package:eventos/core/utils/dependency_management/service_locator.dart';
import 'package:eventos/features/create_event/data/repos/create_event_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateEventView extends StatefulWidget {
  const CreateEventView({super.key});

  @override
  _CreateEventViewState createState() => _CreateEventViewState();
}

class _CreateEventViewState extends State<CreateEventView> {
  final _formKey = GlobalKey<FormState>();
  String? title;
  String? description;
  int? pepoleNumber;
  String? date;
  String? type;
  List<TimeLine> timeLine = [];

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _timeLineDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Your Event Now",
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  onSaved: (value) => title = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a title' : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  onSaved: (value) => description = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a description' : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Number of People'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) => pepoleNumber = int.tryParse(value!),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter number of people' : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(labelText: 'Date'),
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  validator: (value) =>
                      value!.isEmpty ? 'Please select a date' : null,
                ),
                const SizedBox(height: 20),
                _buildTypeDropdown(),
                const SizedBox(height: 20),
                _buildTimeLineSection(),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitFirstStep,
                    child: const Text("Next"),
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTypeDropdown() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(labelText: 'Type'),
      value: type,
      onChanged: (String? newValue) {
        setState(() {
          type = newValue;
        });
      },
      items: ['pending', 'confirmed', 'cancelled']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      validator: (value) => value == null ? 'Please select event type' : null,
    );
  }

  Widget _buildTimeLineSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          "Add Timelines",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _timeController,
          decoration: const InputDecoration(labelText: 'Start Time'),
          readOnly: true,
          onTap: () => _selectTime(context, _timeController),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _endTimeController,
          decoration: const InputDecoration(labelText: 'End Time'),
          readOnly: true,
          onTap: () => _selectTime(context, _endTimeController),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _timeLineDescriptionController,
          decoration: const InputDecoration(labelText: 'Description'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _addTimeLine,
          child: const Text("Add Timeline"),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children:
              timeLine.map((timeline) => _buildTimelineCard(timeline)).toList(),
        ),
      ],
    );
  }

  Widget _buildTimelineCard(TimeLine timeline) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${timeline.startTime} - ${timeline.endTime}",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(timeline.description!,
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        date = DateFormat('yyyy-MM-dd').format(picked);
        _dateController.text = date!;
      });
    }
  }

  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final now = DateTime.now();
      final formattedTime = DateFormat('HH:mm').format(
          DateTime(now.year, now.month, now.day, picked.hour, picked.minute));
      setState(() {
        controller.text = formattedTime;
      });
    }
  }

  void _addTimeLine() {
    if (_timeController.text.isNotEmpty &&
        _endTimeController.text.isNotEmpty &&
        _timeLineDescriptionController.text.isNotEmpty) {
      setState(() {
        timeLine.add(
          TimeLine(
            startTime: _timeController.text,
            endTime: _endTimeController.text,
            description: _timeLineDescriptionController.text,
          ),
        );
        _timeController.clear();
        _endTimeController.clear();
        _timeLineDescriptionController.clear();
      });
    }
  }

  void _submitFirstStep() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    CreateEventCubit(getIt.get<CreateEventRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    ServiceProvidersCubit(homeRepo: getIt.get<HomeRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    VenueCubit(homeRepo: getIt.get<HomeRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    EventsCategoryCubit(homeRepo: getIt.get<HomeRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    ServicecategoriesCubit(homeRepo: getIt.get<HomeRepoImpl>()),
              ),
            ],
            child: SecondStepScreen(
              title: title!,
              description: description!,
              pepoleNumber: pepoleNumber!,
              date: date!,
              type: type!,
              timeLine: timeLine,
            ),
          ),
        ),
      );
    }
  }
}
