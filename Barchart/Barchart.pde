
import org.gicentre.utils.stat.*;    // For chart classes.
 
// Sketch to to draw a very simple bar chart.
// Version 1.1, 3rd November, 2013.
// Author Jo Wood.
 
BarChart barChart;
Table table; 

// Initialises the sketch and loads data into the chart.
void setup()
{
  size(300,200);
  
  table = loadTable("week_allvid_sumdurationNew.csv", "header");

  println(table.getRowCount() + " total rows in table"); 
  
  float[] data = new float[table.getRowCount()];
  
  int i = 0;
  for (TableRow row : table.rows()) {
    
    String calendar = row.getString("calendar");
    int duration = row.getInt("duration");
    
    println("calendar: " +calendar+ " duration: " +duration);
    data[i] = duration;
    i++;
    
  }
  
  barChart = new BarChart(this);
  barChart.setData(data);
  
}

// Draws the chart in the sketch
void draw()
{
  background(255);
  barChart.draw(15,15,width-30,height-30); 
}