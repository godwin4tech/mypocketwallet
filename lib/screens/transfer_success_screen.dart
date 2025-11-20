import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/primary_button.dart';
import '../utils/routes.dart';

class TransferSuccessScreen extends StatelessWidget {
  final String amount;
  final String recipient;

  const TransferSuccessScreen({
    super.key,
    required this.amount,
    required this.recipient,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Color.alphaBlend(
                    AppColors.successGreen.withValues(alpha: 0.1),
                    Colors.transparent,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 60,
                  color: AppColors.successGreen,
                ),
              ),
              
              const SizedBox(height: 32),
              
              const Text(
                'Transfer Successful!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.deepBlue,
                ),
              ),
              
              const SizedBox(height: 16),
              
              Text(
                'You have successfully transferred \$$amount to $recipient',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
              
              const SizedBox(height: 32),
              
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    _buildDetailRow('Amount', '\$$amount'),
                    _buildDetailRow('Recipient', recipient),
                    _buildDetailRow(
                      'Transaction ID', 
                      'TXN${DateTime.now().millisecondsSinceEpoch}',
                    ),
                    _buildDetailRow('Date', DateTime.now().toString().split(' ')[0]),
                    _buildDetailRow('Time', TimeOfDay.now().format(context)),
                    _buildDetailRow('Status', 'Completed', isSuccess: true),
                  ],
                ),
              ),
              
              const Spacer(),
              
              Column(
                children: [
                  PrimaryButton(
                    text: 'Back to Home',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.home,
                        (route) => false,
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () {
                      _showShareOptions(context);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.deepBlue,
                      side: const BorderSide(color: AppColors.deepBlue),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.share, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Share Receipt',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Receipt downloaded successfully!'),
                          backgroundColor: AppColors.successGreen,
                        ),
                      );
                    },
                    child: const Text(
                      'Download Receipt',
                      style: TextStyle(
                        color: AppColors.orangeAccent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isSuccess = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.darkGray,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isSuccess ? AppColors.successGreen : AppColors.deepBlue,
            ),
          ),
        ],
      ),
    );
  }

  void _showShareOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Share Receipt',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildShareOption(Icons.message, 'Message'),
                  _buildShareOption(Icons.email, 'Email'),
                  _buildShareOption(Icons.copy, 'Copy'),
                  _buildShareOption(Icons.more_horiz, 'More'),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShareOption(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            color: AppColors.lightGray,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.deepBlue),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
