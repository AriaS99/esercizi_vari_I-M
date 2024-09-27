
using esercizio02.classes;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace esercizio02
{
    internal class Program
    {
        static void Main(string[] args)
        {

            bool insAbi = true;
            List<Studente> Lista = new List<Studente>();


            while (insAbi)
            {
                Console.WriteLine("Dimmi cosa vuoi fare: " +
                    "\nA - Aggiungi Studente" +
                    "\nM - Modifica Dati Studente" +
                    "\nS - Visualizza tutti gli Studenti" +
                    "\nV - Visualizza studenti in base all'intervallo di voti" +
                    "\nE - Elimina uno Studente" +
                    "\nQ - Esci");
                string? inputUtente = Console.ReadLine();

                if (inputUtente is not null)
                    inputUtente = inputUtente.ToUpper();

                try
                {
                    switch (inputUtente)
                    {
                        case "A":
                            try
                            {
                                Console.Write("Inserisci il Nome: ");
                                string? varNome = Console.ReadLine();
                                Console.Write("Inserisci il Cognome: ");
                                string? varCognome = Console.ReadLine();
                                Console.Write("Inserisci il Voto: ");
                                double varVoto = Convert.ToDouble(Console.ReadLine());
                                if (varVoto >= 0 && varVoto <= 10)
                                {
                                    Lista.Add(new Studente(varNome, varCognome, varVoto));
                                    Console.WriteLine($"Hai aggiunto {varNome} {varCognome} con il voto: {varVoto}");
                                }
                                else
                                {
                                    Console.WriteLine("Errore! il voto può essere solo da 0 a 10");
                                }
                            }
                            catch
                            {
                                Console.WriteLine("! ERRORE DI INSERIMENTO CONTROLLA INPUT !");
                            }
                            break;
                        case "M":
                            Console.Write("Inserisci il Nome dello Studente che vuoi Modificare: ");
                            string? stuDaMod = Console.ReadLine();
                            foreach(Studente stu in Lista)
                            {
                                if (stuDaMod.Equals(stu.Nome))
                                {
                                    Console.WriteLine("Scegli cosa vuoi modificare:" +
                                        "\nN - Nome" +
                                        "\nC - Cognome" +
                                        "\nV - voto");
                                    string? scelta = Console.ReadLine();
                                    if (scelta is not null)
                                        scelta = scelta.ToUpper();
                                    switch (scelta)
                                    {
                                        case "N":
                                            Console.Write("Inserisci il nome corretto: ");
                                            string? newNome = Console.ReadLine();
                                            stu.Nome = newNome;
                                            break;
                                        case "C":
                                            Console.Write("Inserisci il cognome corretto: ");
                                            string? newCognome = Console.ReadLine();
                                            stu.Cognome = newCognome;
                                            break;
                                        case "V":
                                            Console.Write("Inserisci il voto corretto: ");
                                            double newVoto = Convert.ToDouble(Console.ReadLine());
                                            stu.Voto = newVoto;
                                            break;
                                        default:
                                            Console.WriteLine("----------------------------");
                                            Console.WriteLine("! Comando non riconosciuto !");
                                            Console.WriteLine("----------------------------");
                                            break;
                                    }
                                }else
                                {
                                    Console.WriteLine("--------------------");
                                    Console.WriteLine("! Nome non trovato !");
                                    Console.WriteLine("--------------------");
                                }
                            }
                            break;
                        case "S":
                            Console.WriteLine("Lista Studenti: ");
                            foreach (Studente stu in Lista)
                                Console.WriteLine(stu);
                            break;
                        case "V":
                            Console.Write("Inserisci il primo Voto per visualizzare l'intervallo: ");
                            double voto1 = Convert.ToDouble(Console.ReadLine());
                            Console.Write("Inserisci il secondo Voto per visualizzare l'intervallo: ");
                            double voto2 = Convert.ToDouble(Console.ReadLine());

                            Console.WriteLine($"Lista studenti dal voto: {voto1} al voto: {voto2}");
                            foreach (Studente stu in Lista)
                            {
                                if (stu.Voto >= voto1 && stu.Voto <= voto2 || stu.Voto <= voto1 && stu.Voto >= voto2)
                                {
                                    Console.WriteLine(stu);
                                }
                            }
                            break;
                        case "E":
                            Console.Write("Inserisci il nome dello studente che vuoi Eliminare: ");
                            string? stuDaElim = Console.ReadLine();

                            for (int i = Lista.Count - 1; i >= 0; i--)
                            {
                                if (Lista[i].Nome.Equals(stuDaElim))
                                {
                                    Lista.RemoveAt(i);
                                    Console.WriteLine($"Hai rimosso lo studente: {stuDaElim}");
                                }else
                                    Console.WriteLine("Errore durante la rimozione!");
                            }
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
