import 'package:flutter/material.dart';

class CommonAutocomplete
    extends StatelessWidget {
  final String label;

  final String hint;

  final List<String> options;

  final String initialValue;

  final Function(String)
  onChanged;

  final Function(String)?
  onSubmitted;

  final Function(String)?
  onSelected;

  const CommonAutocomplete({
    super.key,

    required this.label,

    required this.hint,

    required this.options,

    required this.initialValue,

    required this.onChanged,

    this.onSubmitted,

    this.onSelected,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [
        Text(
          label,

          style: const TextStyle(
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 8),

        Autocomplete<String>(
          initialValue:
              TextEditingValue(
                text:
                    initialValue,
              ),

          optionsBuilder: (
            textEditingValue,
          ) {
            if (textEditingValue
                .text
                .isEmpty) {
              return options;
            }

            return options.where(
              (option) => option
                  .toLowerCase()
                  .contains(
                    textEditingValue
                        .text
                        .toLowerCase(),
                  ),
            );
          },

          onSelected: (value) {
            onSelected?.call(
              value,
            );
          },

          fieldViewBuilder: (
            context,
            controller,
            focusNode,
            onFieldSubmitted,
          ) {
            controller.text =
                initialValue;

            return TextField(
              controller:
                  controller,

              focusNode:
                  focusNode,

              style:
                  const TextStyle(
                    color:
                        Colors.white,
                  ),

              decoration:
                  InputDecoration(
                    hintText: hint,

                    filled: true,

                    fillColor:
                        Colors.black,

                    border:
                        OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                                12,
                              ),
                        ),
                  ),

              onChanged:
                  onChanged,

              onSubmitted:
                  onSubmitted,
            );
          },

          optionsViewBuilder: (
            context,
            onSelected,
            options,
          ) {
            return Align(
              alignment:
                  Alignment
                      .topLeft,

              child: Material(
                elevation: 8,

                borderRadius:
                    BorderRadius.circular(
                      12,
                    ),

                child:
                    Container(
                      width:
                          MediaQuery.of(
                                context,
                              )
                              .size
                              .width -
                          32,

                      constraints:
                          const BoxConstraints(
                            maxHeight:
                                220,
                          ),

                      decoration:
                          BoxDecoration(
                            color:
                                Colors
                                    .black,

                            borderRadius:
                                BorderRadius.circular(
                                  12,
                                ),

                            border:
                                Border.all(
                                  color:
                                      Colors
                                          .grey,
                                ),
                          ),

                      child:
                          ListView.separated(
                            shrinkWrap:
                                true,

                            padding:
                                EdgeInsets.zero,

                            itemCount:
                                options
                                    .length,

                            separatorBuilder:
                                (
                                  _,
                                  __,
                                ) => Divider(
                                  height:
                                      1,

                                  color:
                                      Colors
                                          .grey
                                          .shade800,
                                ),

                            itemBuilder:
                                (
                                  context,
                                  index,
                                ) {
                                  final option =
                                      options
                                          .elementAt(
                                            index,
                                          );

                                  return ListTile(
                                    dense:
                                        true,

                                    title:
                                        Text(
                                          option,

                                          style:
                                              const TextStyle(
                                                color:
                                                    Colors.white,
                                              ),
                                        ),

                                    onTap: () {
                                      onSelected(
                                        option,
                                      );
                                    },
                                  );
                                },
                          ),
                    ),
              ),
            );
          },
        ),
      ],
    );
  }
}