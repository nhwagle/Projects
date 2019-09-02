<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%!
//public int k = 0;
    public String sequence;
    public Hashtable<String, Integer> frequencies = new Hashtable<String, Integer>();
    
    
    public void listKmers(int k)
    {
        String kmer = "";
        String rkmer = "";
        String rseq = computeReverseComplements();
        for(int i = 0; i < sequence.length()-k+1; i++)
        {
            kmer = sequence.substring(i, i+k);
            rkmer = rseq.substring(rseq.length()-k-i, rseq.length()-i);
            if(kmer.compareTo(rkmer) < 0)
            {
                if(frequencies.containsKey(kmer))
                    frequencies.replace(kmer, frequencies.get(kmer), frequencies.get(kmer)+1);
                else
                    frequencies.put(kmer, 1);
            }
            else
            {
                if(frequencies.containsKey(rkmer))
                    frequencies.replace(rkmer, frequencies.get(rkmer), frequencies.get(rkmer)+1);
                else
                    frequencies.put(rkmer, 1);
            }
            kmer = "";
            rkmer = "";
        }
    }
    
    public String computeReverseComplements()
    {
        String rkmer;
        rkmer = sequence.replaceAll("A", "X");
        rkmer = rkmer.replaceAll("T", "A");
        rkmer = rkmer.replaceAll("X", "T");
        rkmer = rkmer.replaceAll("C", "X");
        rkmer = rkmer.replaceAll("G", "C");
        rkmer = rkmer.replaceAll("X", "G");
        rkmer = new StringBuffer(rkmer).reverse().toString();
        return rkmer;
    }
	public int searchKmer(String kmer)
{
	if(frequencies.containsKey(kmer))
		return(frequencies.get(kmer));
	else
		return 0;
}
%>
<%
	File f = new File("C:/data/file1.txt");
FileReader fread;
BufferedReader bread;
String line = "";
sequence = "";
int k = Integer.parseInt(request.getParameter("k"));
try
                {
                    fread = new FileReader(f);
                    bread = new BufferedReader(fread);
                    line = bread.readLine();
                    while(!((line = bread.readLine()) == null))
                    {
                            if(line.contains(">"))
                                    sequence = "";
                            else
                            {
                                    sequence += line;
                                    listKmers(k);
                                    sequence = sequence.substring(sequence.length()-k+1, sequence.length());
                            }
                    }
    
                    fread.close();
                    bread.close();
                }catch(Exception e)
                {
                        //out.println("Failure");
                }
String kmer = request.getParameter("kmer");
out.println(searchKmer(kmer));
%>