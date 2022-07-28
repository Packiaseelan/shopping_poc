import 'package:flutter/material.dart';

class AddToCartButtonWidget extends StatelessWidget {
  final int value;
  final Function onAdd;
  final Function onRemove;
  final bool isCustomisable;

  const AddToCartButtonWidget({
    Key? key,
    required this.value,
    required this.onAdd,
    required this.onRemove,
    this.isCustomisable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: value == 0 ? _buildButton(context) : _buildStepper(),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => onAdd(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text('Add', style: Theme.of(context).textTheme.bodySmall),
          ),
        ),
        if (isCustomisable)
        InkWell(
            onTap: () => onAdd(),
            child: Text('Customise', style: Theme.of(context).textTheme.bodyLarge),
          ),
      ],
    );
  }

  Widget _buildStepper() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(onTap: () => onRemove(), child: const Icon(Icons.remove, color: Colors.white)),
        Text('$value'),
        InkWell(onTap: () => onAdd(), child: const Icon(Icons.add, color: Colors.white)),
      ],
    );
  }
}
