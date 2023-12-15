using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Registration_Form_With_Captcha_Math_Question
{
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillCapctha();
                GenerateMathQuestion();
            }           
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                if (Session["captcha"].ToString() != txtCaptcha.Text)
                    lblValidation.Text = "Invalid Captcha Code";
                else
                {
                    int userAnswer;
                    if (int.TryParse(txtMathAnswer.Text, out userAnswer))
                    {
                        // Validate the user's answer
                        int n1 = Convert.ToInt32(Session["Num1"]);
                        int n2 = Convert.ToInt32(Session["Num2"]);

                        if (userAnswer == (n1 + n2))
                        {
                            lblValidation.Text = "Answer is correct!"; // Correct answer
                            //insert update code
                        }
                        else
                        {
                            lblValidation.Text = "Answer is incorrect!"; // Incorrect answer
                            GenerateMathQuestion(); // Regenerate new numbers
                        }
                    }
                    else
                    {
                        lblValidation.Text = "Please enter a valid number!"; // Invalid input
                    }
                }                
            }
            else
            {
                lblValidation.Text = "validation error...Please enter value!"; // Invalid input
            }
            
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            FillCapctha();
        }
        void FillCapctha()
        {
            try
            {
                Random random = new Random();
                string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                StringBuilder captcha = new StringBuilder();
                for (int i = 0; i < 6; i++)
                {
                    captcha.Append(combination[random.Next(combination.Length)]);
                    Session["captcha"] = captcha.ToString();
                    imgCaptcha.ImageUrl = "CatchpaRegistrationpage.aspx?" + DateTime.Now.Ticks.ToString();
                }
            }
            catch
            {
                throw;
            }
        }

        protected void GenerateMathQuestion()
        {
            Random rnd = new Random();

            int number1 = rnd.Next(1, 100); // Generates a random number between 1 and 100
            int number2 = rnd.Next(1, 100); // Generates another random number between 1 and 100

            // Store these numbers in session or view state for validation purposes
            Session["Num1"] = number1;
            Session["Num2"] = number2;

            // Display the question on the page
            lblMathQuestion.Text = $"What is <b>{number1}</b> + <b>{number2}</b> = ?";
        }
    }
}