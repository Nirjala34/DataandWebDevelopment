using System.IO;
using System.Text.RegularExpressions;

class ThemeUpdater {
    static void Main() {
        string[] files = Directory.GetFiles(".", "*.aspx");
        foreach(string file in files) {
            string content = File.ReadAllText(file);
            
            if (file.EndsWith("Default.aspx")) {
                continue; // We will update Default.aspx using multi_replace_file_content
            }
            
            // Replace old cinematic black/red with new Movie App UI Kit (Purple/Magenta)
            content = content.Replace("#111111", "#2A004D"); // Dark purple header
            content = content.Replace("#e50914", "#D900C5"); // Magenta border/accents
            content = content.Replace("border-bottom: 2px solid #f59e0b", "border-bottom: 2px solid #D900C5");
            content = content.Replace("color: #1e293b", "color: #3b0a66");
            
            // Updates to buttons to match the vibrant magenta feel
            content = content.Replace("btn-danger", "btn-dark"); // Resetting old danger
            content = content.Replace("table-dark", "table-light"); 
            
            File.WriteAllText(file, content);
        }
    }
}
