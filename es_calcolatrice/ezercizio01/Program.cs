using System.Data.SqlTypes;

namespace ezercizio01
{
    internal class Program
    {
        static void Main(string[] args)
        {
            bool insAbi = true;

            while (insAbi)
            {
                Console.WriteLine("Dimmi cosa vuoi fare: " +
                    "\n- + : somma"+
                    "\n- - : sottrazione" +
                    "\n- / : divisione" +
                    "\n- * : moltiplicazione" +
                    "\n- P : potenza" +
                    "\n- R : radice quadrata" +
                    "\n- Q per uscire ");
                string? inputUtente = Console.ReadLine();

                if (inputUtente is not null)
                    inputUtente = inputUtente.ToUpper();

                try
                {
                    switch (inputUtente)
                    {
                        case "+":
                            Console.Write("Inserisci il primo numero: ");
                            double num1 = Convert.ToDouble(Console.ReadLine());
                            Console.Write("Inserisci il secondo numero: ");
                            double num2 = Convert.ToDouble(Console.ReadLine());

                            Console.WriteLine($"Hai digitato: {num1} + {num2} = {num1 + num2}");
                            break;
                        case "-":
                            Console.Write("Inserisci il primo numero: ");
                            num1 = Convert.ToDouble(Console.ReadLine());
                            Console.Write("Inserisci il secondo numero: ");
                            num2 = Convert.ToDouble(Console.ReadLine());

                            Console.WriteLine($"Hai digitato: {num1} - {num2} = {num1 - num2}");
                            break;
                        case "/":
                            Console.Write("Inserisci il primo numero: ");
                            num1 = Convert.ToDouble(Console.ReadLine());
                            Console.Write("Inserisci il secondo numero: ");
                            num2 = Convert.ToDouble(Console.ReadLine());

                            if (num1 == 0 || num2 == 0)
                                Console.WriteLine("! ERRORE non puoi dividere per 0 !");
                            else
                                Console.WriteLine($"Hai digitato: {num1} / {num2} = {num1 / num2}");
                            break;
                        case "*":
                            Console.Write("Inserisci il primo numero: ");
                            num1 = Convert.ToDouble(Console.ReadLine());
                            Console.Write("Inserisci il secondo numero: ");
                            num2 = Convert.ToDouble(Console.ReadLine());

                            Console.WriteLine($"Hai digitato: {num1} * {num2} = {num1 * num2}");
                            break;
                        case "P":
                            Console.Write("Inserisci il primo numero: ");
                            num1 = Convert.ToDouble(Console.ReadLine());
                            Console.Write("Inserisci il secondo numero: ");
                            num2 = Convert.ToDouble(Console.ReadLine());

                            Console.WriteLine($"Hai calcolato la potenza dei numeri: {num1}, {num2} risultato: {Math.Pow(num1, num2)}");
                            break;
                        case "R":
                            Console.Write("Inserisci il primo numero: ");
                            num1 = Convert.ToDouble(Console.ReadLine());

                            Console.WriteLine($"Hai calcolato la radice quadrata del numero: {num1} risultato: {Math.Sqrt(num1)}");
                            break;
                        case "Q":
                            insAbi = !insAbi;
                            break;
                        default:
                            Console.WriteLine("----------------------------");
                            Console.WriteLine("! Comando non riconosciuto !");
                            Console.WriteLine("----------------------------");
                            break;
                    }
                }
                catch (FormatException ex) 
                {
                    Console.WriteLine(ex.Message);
                }
            }




        }
    }
}

