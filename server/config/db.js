import mongoose from "mongoose";
import chalk from "chalk";
import dotenv from "dotenv";
dotenv.config();

const connectDB = async () => {
  try {
    console.log("Attempting to connect to MongoDB...");
    console.log("MongoDB URL:", process.env.MONGO_URL ? "Set" : "Not set");
    
    await mongoose.connect(process.env.MONGO_URL, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });

    console.log(`${chalk.green("✓")} ${chalk.blue("MongoDB Connected Successfully!")}`);
  } catch (error) {
    console.error(`${chalk.red("✗")} MongoDB Connection Error:`);
    console.error("Error details:", error.message);
    console.error("Please check:");
    console.error("1. MongoDB Atlas Network Access (IP whitelist)");
    console.error("2. MONGO_URL environment variable");
    console.error("3. MongoDB Atlas cluster status");
    throw error;
  }
};

export default connectDB