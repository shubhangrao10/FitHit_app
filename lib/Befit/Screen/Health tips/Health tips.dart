import 'package:BeFit/Befit/UI/Home/Homepage.dart';
import 'package:flutter/material.dart';

class HealthTipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        title: const Text(
          "Health & Nutrition's Tip's",
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nutrition Tips',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            _buildNutritionTips(),
            SizedBox(height: 32.0),
            Text(
              'Workout Tips',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            _buildWorkoutTips(),
          ],
        ),
      ),
    );
  }

  Widget _buildNutritionTips() {
    return Column(
      children: [
        _buildTipCard(
          'Stay Hydrated',
          'Drink plenty of water throughout the day to stay hydrated. Water is essential for overall health and aids in digestion.',
          Icons.local_drink,
        ),
        SizedBox(height: 16.0),
        _buildTipCard(
          'Balance Your Diet',
          'Include a variety of fruits, vegetables, lean proteins, and whole grains in your diet for a balanced nutrition profile.',
          Icons.restaurant,
        ),
        SizedBox(height: 16.0),
        _buildTipCard(
          'Limit Processed Foods',
          'Reduce intake of processed and sugary foods. Opt for whole, natural foods to fuel your body with essential nutrients.',
          Icons.fastfood,
        ),
        SizedBox(height: 16.0),
        _buildTipCard(
          'Eat Mindfully',
          'Practice mindful eating by savoring each bite, eating slowly, and paying attention to hunger and fullness cues.',
          Icons.sentiment_satisfied_alt,
        ),
        SizedBox(height: 16.0),
        _buildTipCard(
          'Get Adequate Protein',
          'Ensure an adequate protein intake to support muscle growth and repair. Include sources like lean meat, dairy, and plant-based proteins.',
          Icons.local_dining,
        ),
      ],
    );
  }

  Widget _buildWorkoutTips() {
    return Column(
      children: [
        _buildTipCard(
          'Mix Cardio and Strength Training',
          'Combine cardiovascular exercises with strength training for a well-rounded workout routine. This helps burn calories and build muscle.',
          Icons.fitness_center,
        ),
        SizedBox(height: 16.0),
        _buildTipCard(
          'Listen to Your Body',
          "Pay attention to your body's signals during workouts. Rest when needed and avoid pushing yourself too hard to prevent injuries.",
          Icons.accessibility,
        ),
        SizedBox(height: 16.0),
        _buildTipCard(
          'Include Flexibility Exercises',
          'Incorporate stretching and flexibility exercises into your routine to improve mobility and reduce the risk of injuries.',
          Icons.access_time,
        ),
        SizedBox(height: 16.0),
        _buildTipCard(
          'Set Realistic Goals',
          'Set achievable and realistic fitness goals to stay motivated. Celebrate small victories along the way to keep yourself inspired.',
          Icons.flag,
        ),
        SizedBox(height: 16.0),
        _buildTipCard(
          'Rest and Recovery',
          'Allow your body sufficient time to rest and recover between intense workouts. Adequate sleep is crucial for muscle repair and overall well-being.',
          Icons.hotel,
        ),
      ],
    );
  }

  Widget _buildTipCard(String title, String description, IconData icon) {
    return Card(
      color: Colors.blue.shade100,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          size: 80,
          color: Colors.green.shade800,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.w500,
                color: Colors.black
            ),
          ),
        ),
      ),
    );
  }
}
