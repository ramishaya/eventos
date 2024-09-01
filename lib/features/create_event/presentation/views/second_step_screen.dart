import 'package:eventos/features/home/presentation/view_models/events_category_cubit/events_category_cubit.dart';
import 'package:eventos/features/home/presentation/view_models/service_categories_cubit/service_categories_cubit.dart';
import 'package:eventos/features/home/presentation/view_models/service_providers_cubit/service_providers_cubit.dart';
import 'package:eventos/features/home/presentation/view_models/venue_cubit/venue_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventos/features/create_event/data/models/create_event_model.dart';
import 'package:eventos/features/create_event/presentation/view_models/cubit/create_event_cubit.dart';

class SecondStepScreen extends StatefulWidget {
  final String title;
  final String description;
  final int pepoleNumber;
  final String date;
  final String type;
  final List<TimeLine> timeLine;

  const SecondStepScreen({
    super.key,
    required this.title,
    required this.description,
    required this.pepoleNumber,
    required this.date,
    required this.type,
    required this.timeLine,
  });

  @override
  _SecondStepScreenState createState() => _SecondStepScreenState();
}

class _SecondStepScreenState extends State<SecondStepScreen> {
  final _formKey = GlobalKey<FormState>();
  int? eventCategoryId;
  int? venueId;
  int? serviceCategoryId;
  Map<int, List<Map<String, dynamic>>> selectedServiceProviders = {};

  @override
  void initState() {
    super.initState();
    // Fetch the initial data from APIs using the cubits
    BlocProvider.of<EventsCategoryCubit>(context).fetchEventsCategories();
    BlocProvider.of<VenueCubit>(context).fetchVenues();
    BlocProvider.of<ServicecategoriesCubit>(context)
        .fetchServiceProvidersCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Additional Event Details",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: BlocConsumer<CreateEventCubit, CreateEventState>(
        listener: (context, state) {
          if (state is CreateEventLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.sucessMessage),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is CreateEventFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEventCategoryDropdown(),
                    const SizedBox(height: 20),
                    _buildVenueDropdown(),
                    const SizedBox(height: 20),
                    _buildServiceCategoryDropdown(),
                    const SizedBox(height: 20),
                    if (serviceCategoryId != null)
                      _buildServiceProvidersDropdown(),
                    const SizedBox(height: 20),
                    _buildSelectedServiceProviders(),
                    const SizedBox(height: 20),
                    if (state is CreateEventLoading)
                      const Center(child: CircularProgressIndicator()),
                    if (state is! CreateEventLoading)
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          child: const Text("Submit"),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEventCategoryDropdown() {
    return BlocBuilder<EventsCategoryCubit, EventsCategoryState>(
      builder: (context, state) {
        if (state is EventsCategoryLoading) {
          return const CircularProgressIndicator();
        } else if (state is EventsCategoryLoaded) {
          return DropdownButtonFormField<int>(
            decoration: const InputDecoration(labelText: 'Event Category'),
            items: state.categoryModel.data!.map((category) {
              return DropdownMenuItem<int>(
                value: category.id,
                child: Text(category.name!),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                eventCategoryId = value;
              });
            },
            validator: (value) =>
                value == null ? 'Please select an event category' : null,
          );
        } else if (state is EventsCategoryFailure) {
          return Text("Error: ${state.errMessage}");
        } else {
          return const Text("No data available");
        }
      },
    );
  }

  Widget _buildVenueDropdown() {
    return BlocBuilder<VenueCubit, VenueState>(
      builder: (context, state) {
        if (state is VenueStateLoading) {
          return const CircularProgressIndicator();
        } else if (state is VenueStateLoaded) {
          return DropdownButtonFormField<int>(
            decoration: const InputDecoration(labelText: 'Venue'),
            items: state.venueModel.data!.map((venue) {
              return DropdownMenuItem<int>(
                value: venue.id,
                child: Text(venue.name!),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                venueId = value;
              });
            },
            validator: (value) =>
                value == null ? 'Please select a venue' : null,
          );
        } else if (state is VenueStateFailure) {
          return Text("Error: ${state.errMessage}");
        } else {
          return const Text("No data available");
        }
      },
    );
  }

  Widget _buildServiceCategoryDropdown() {
    return BlocBuilder<ServicecategoriesCubit, ServicecategoriesState>(
      builder: (context, state) {
        if (state is ServicecategoriesStateLoading) {
          return const CircularProgressIndicator();
        } else if (state is ServicecategoriesStateLoaded) {
          return DropdownButtonFormField<int>(
            decoration: const InputDecoration(labelText: 'Service Category'),
            items: state.categoryModel.data!.map((category) {
              return DropdownMenuItem<int>(
                value: category.id,
                child: Text(category.name!),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                serviceCategoryId = value;
                BlocProvider.of<ServiceProvidersCubit>(context)
                    .fetchServiceProviders(serviceCategoryId!);
              });
            },
            validator: (value) =>
                value == null ? 'Please select a service category' : null,
          );
        } else if (state is ServicecategoriesStateFailure) {
          return Text("Error: ${state.errMessage}");
        } else {
          return const Text("No data available");
        }
      },
    );
  }

  Widget _buildServiceProvidersDropdown() {
    return BlocBuilder<ServiceProvidersCubit, ServiceProvidersState>(
      builder: (context, state) {
        if (state is ServiceProvidersLoading) {
          return const CircularProgressIndicator();
        } else if (state is ServiceProvidersLoaded) {
          return DropdownButtonFormField<int>(
            decoration: const InputDecoration(labelText: 'Service Providers'),
            items: state.serviceProvidersModel.data!.map((provider) {
              return DropdownMenuItem<int>(
                value: provider.id,
                child: Text(provider.name!),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                if (serviceCategoryId != null && value != null) {
                  selectedServiceProviders.putIfAbsent(
                      serviceCategoryId!, () => []);
                  if (!selectedServiceProviders[serviceCategoryId!]!
                      .any((provider) => provider['id'] == value)) {
                    selectedServiceProviders[serviceCategoryId!]!.add({
                      'id': value,
                      'name': state.serviceProvidersModel.data!
                          .firstWhere((provider) => provider.id == value)
                          .name,
                      'categoryName': state.serviceProvidersModel.data!
                          .firstWhere((provider) => provider.id == value)
                          .serviceCategory
                          ?.name,
                    });
                  }
                }
              });
            },
            validator: (value) => selectedServiceProviders.isEmpty
                ? 'Please select at least one service provider'
                : null,
          );
        } else if (state is ServiceProvidersFailure) {
          return Text("Error: ${state.errMessage}");
        } else {
          return const Text("No data available");
        }
      },
    );
  }

  Widget _buildSelectedServiceProviders() {
    List<Widget> providerChips = [];

    selectedServiceProviders.forEach((categoryId, providers) {
      providers.forEach((provider) {
        providerChips.add(
          Chip(
            label: Text(
                '${provider['name']} (Category: ${provider['categoryName']})'),
            onDeleted: () {
              setState(() {
                selectedServiceProviders[categoryId]!.remove(provider);
                if (selectedServiceProviders[categoryId]!.isEmpty) {
                  selectedServiceProviders.remove(categoryId);
                }
              });
            },
          ),
        );
      });
    });

    return Wrap(
      spacing: 8.0,
      children: providerChips,
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      List<int> allServiceProviderIds = selectedServiceProviders.values
          .expand(
              (providers) => providers.map((provider) => provider['id'] as int))
          .toList();

      BlocProvider.of<CreateEventCubit>(context).createEvent(
        title: widget.title,
        eventCategoryId: eventCategoryId!,
        description: widget.description,
        pepoleNumber: widget.pepoleNumber,
        venueId: venueId!,
        serviceProviderId: allServiceProviderIds,
        date: widget.date,
        type: widget.type,
        timeLine: widget.timeLine,
      );
    }
  }
}
