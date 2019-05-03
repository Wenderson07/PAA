package ordenacao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.Scanner;
import static ordenacao.Main.partition;

public class bckp {
    static long countQuick =0;
    static long countMerge = 0;
    static long countHeap = 0;
//mudei de int para long
	public static long bubbleSort(int a[], int n) {
	    long count = 0;
	    for(int i = 1; i < n; i++) {
		for(int j = 0; j < n - 1; j++) {
		    count++;
		    if(a[j] > a[j + 1]) {
			int aux = a[j];
			a[j] = a[j + 1];
			a[j + 1] = aux;
		    }
		}
	}
	    return count;
	}
	
	
	public static long insertionSort(int a[], int n) {
	    long count = 0;
	    for(int i = 0; i < n; i++) {
		int aux = a[i];
		int j = i - 1;
			count++;
		while(j >= 0 && aux < a[j]) {
			a[j + 1] = a[j];
			j--;
			count++;
		}
		a[j + 1] = aux;
	}
	    return count;
	} 
	
	
	//Conjunto mergeSort
	public static void merge(int a[],int p,int q,int r){
	    int n1 = q - p +1;
	    int n2 = r -q;
	    int left[] = new int[n1+1];
	    int right[] = new int[n2+1];   
	    int i = 0, j = 0, k = 0;
	       
	    for(i = 0; i < n1; i++){
	    	left[i] = a[p+i];
	    }
	    
	    for(j = 0; j < n2; j++){
	    	right[j] = a[q+j+1];
	    }
	    
	    left[n1]  = Integer.MAX_VALUE;
	    right[n2] = Integer.MAX_VALUE;
	    i = j = 0;
	       
	    for(k = p;k <= r; k++){
		countMerge++;
	    	if(left[i] <= right[j]){
		    a[k] = left[i];
		    i = i+1;
		} else {
		    a[k] = right[j];
		    j = j+1;
		}
	    }
	}    
	public static void mergeSort(int a[],int p,int r){
	    if(p < r){
		int q = (p+r)/2;
		mergeSort(a,p,q);
		mergeSort(a,q+1,r);
		merge(a,p,q,r);
	    }
	}
	
	
	public static int troca(int a, int b) {
	    return a;
	}
	
	
		//Conjunto quickSort
	public static int partition(int a[], int p, int r){
		int x = a[r];
		int i = p - 1;
		
		for(int j = p; j <= r-1; j++){
		    countQuick++;
		    if(a[j] <= x){
			i++;
			int temp = a[i];
			a[i] = a[j];
			a[j] = temp;
		    }
		}
		int temp = a[i+1];
		a[i+1] = a[r];
		a[r] = temp;
		return i+1;
		
	}
	    
	public static void quickSort(int a[], int p, int r){
	    if(p < r){
		int q = partition(a,p,r);	
		if(q-p <= r -q){
		quickSort(a,p,q-1);
		p = q +1;
		}else{
		quickSort(a,q+1,r);
		r = q -1;
		}
	    }
	}
	
	//Conjunto heapSort
	public static int esquerda(int i){
		return 2*i + 1;
	}
	public static int direita(int i){
		return 2*i + 2;
	}
	public static void refazHeapMax(int a[], int i, int n){
	    int maior;
	    int e = esquerda(i);
	    int d = direita(i);
	    
	    countHeap++;
	    if(e <= n && a[e] > a[i])
		maior = e;
	    else
		maior = i;
		
	    countHeap++;
	    if(d <= n && a[d] > a[maior])
		    maior = d;

	    if(maior != i){
		a[i] = troca(a[maior],a[maior] = a[i]);
		refazHeapMax(a,maior,n);
	    }
	}	
	public static void constroiHeapMax(int a[], int n){
		for(int i = (n/2); i >= 0; i--){
			refazHeapMax(a,i,n);
		}	
	}
	public static void heapSort(int a[]){
	    constroiHeapMax(a, a.length-1);
	    for(int i = a.length-1; i >= 0; i--){
		a[0] = troca(a[i],a[i] = a[0]);
		refazHeapMax(a,0,i-1);
	    }
	}
	
	private static int[] gerarCrescente(int n) {
	    int i;
	    int crescente[] = new int[n];
	    for(i=0;i< n;i++){
		crescente[i] = i + 1;
	    }
	    return crescente;
	}
	private static int[] gerarDecrescente(int n) {
	    int i;
	    int decrescente[] = new int[n];
	    for(i=0;i< n;i++){
		decrescente[i] = n - i;
	    }
	    return decrescente;
	}
	private static int[] gerarAleatorio(int n) {
	    Random gerador = new Random();
	    int i;
	    int aleatorio[] = new int[n];
	    for(i=0;i< n;i++){
		aleatorio[i] = gerador.nextInt(101);
	    }
	    return aleatorio;
	}
	
	private static void imprimirCrescente(long tempo,long compCrescente){
	    System.out.print("\n-----CRESCENTE-----\n> Tempo de Execução(Milissegundos): "+tempo +"\n");
	    System.out.println("> Quantidade de Comparações_Crescente: " + compCrescente);
	}
	
	private static void imprimirDecrescente(long tempo,long compDecrescente){
	    System.out.print("\n-----DECRESCENTE-----\n> Tempo de Execução(Milissegundos): " + tempo);
	    System.out.println("\n> Quantidade de Comparações_Decrescente: " + compDecrescente);
	}
	
	private static void imprimirAleatorio(long tempo,long compAleatorio){
	    System.out.print("\n-----ALEATORIO-----\n> Tempo de Execução(Milissegundos): " + tempo);
	    System.out.println("\n> Quantidade de Comparações_Aleatório: " + compAleatorio);
	}
	
	private static void imprimirMedia(int tamanho,long mediaTCrescente,long mediaTDecrescente,long mediaTAleatorio, long mediaCCrescente, long mediaCDecrescente,long mediaCAleatorio){
	    System.out.println("\nMédia com vetor " + tamanho + ""
			    + "\n Crescente: Tempo = " + mediaTCrescente/3 +" Comparações = "+mediaCCrescente/3+
			    "\n Decrescente: Tempo = " + mediaTDecrescente/3 +" Comparações  =  "+mediaCDecrescente/3+
			    "\n Aleatorio: Tempo = "+mediaTAleatorio/3 + " Comparações = " + mediaCAleatorio);
	}
	public static void main(String[] args) {
	    long compAleatorio, compCrescente, compDecrescente;
	    int tamanho[] = {100,500,1000,5000,30000,80000,100000,150000,200000}; //Vetor de teste
	    int tamanhoVetor = 9;
	    int crescente[] = new int[10]; //Manda vetor em ordem crescente para o algoritmo
	    int decrescente[] = new int[10]; //Manda vetor em ordem decrescente para o algoritmo
	    int aleatorio[] = new int[10]; //Manda vetor em ordem aleatoria para o algoritmo;
	    long mediaTempoCrescente,mediaTempoDecrescente,mediaTempoAleatorio; //Para guardar o tempo de execução do algoritmo
	    long mediaCompCrescente,mediaCompDecrescente,mediaCompAleatorio; //Para guardar o tempo de execução do algoritmo
	    long inicio,fim,tempo; //Para medir o tempo
	    Scanner scan = new Scanner(System.in);
	    int x,y,escolha; // Para for's e escolha do algoritmo de execução
	    System.out.print("\n 0 - Sair\n 1 - Bubble Sort\n 2 - Insertion sort\n 3 - Merge Sort\n 4 - Quick Sort\n 5 - Heap sort\n");
	    escolha = scan.nextInt();

	    while(escolha != 0){
		System.out.println("Executar vetores predefinidos ? S-Sim N-Nao");
		String resposta = scan.next();
		if(resposta.charAt(0) == 'n' || resposta.charAt(0)== 'N'){
		    tamanhoVetor = 1;
		    System.out.println("Digite o tamanho do vetor:");
		    int n = scan.nextInt();
		    tamanho[0] = n;
		}else{ // Mudando entre o padrão e escolha do usuario
		    tamanhoVetor = tamanho.length;
		}
		switch(escolha){
		    case 0:
			break;
		    case 1:
			for(x = 0; x <tamanhoVetor;x++){
			    System.out.println("\nNova execução tamanho do vetor = " + tamanho[x] +"");
			    mediaTempoCrescente = 0;
			    mediaTempoDecrescente = 0;
			    mediaTempoAleatorio = 0;
			    mediaCompCrescente = 0;
			    mediaCompDecrescente = 0;
			    mediaCompAleatorio = 0;
			    for(y = 0;y<3;y++){
				crescente = gerarCrescente(tamanho[x]);  //retorna o vetor x em ordem crescente
				inicio = System.currentTimeMillis();
				compCrescente = bubbleSort(crescente,tamanho[x]);
				fim = System.currentTimeMillis();
				tempo = fim - inicio;
				mediaTempoCrescente += tempo;
				mediaCompCrescente += compCrescente;
				imprimirCrescente(tempo,compCrescente);////Imprime o tempo de execução e quantidade de comparações crescente
				
				//Imprime o tempo de execução e quantidade de comparações decrescente
				decrescente = gerarDecrescente(tamanho[x]);
				inicio = System.currentTimeMillis();
				compDecrescente = bubbleSort(decrescente,tamanho[x]);
				fim = System.currentTimeMillis();
				tempo = fim - inicio;
				mediaTempoDecrescente += tempo;
				mediaCompDecrescente += compDecrescente;

				imprimirDecrescente(tempo, compDecrescente);

				//Imprime o tempo de execução e quantidade de comparações decrescente
				aleatorio = gerarAleatorio(tamanho[x]);
				inicio = System.currentTimeMillis();
				compAleatorio = bubbleSort(aleatorio,tamanho[x]);
				fim = System.currentTimeMillis();
				tempo = fim-inicio;
				mediaTempoAleatorio += tempo;
				mediaCompAleatorio += compAleatorio;
				imprimirAleatorio(tempo, compAleatorio);
			    }
			    imprimirMedia(tamanho[x], mediaTempoCrescente, mediaTempoDecrescente, mediaTempoAleatorio, mediaCompCrescente, mediaCompDecrescente, mediaCompAleatorio);
			}
			break;
		    case 2:
			for(x = 0; x <tamanhoVetor;x++){
			    System.out.println("\nNova execução tamanho do vetor = " + tamanho[x] +"");
			    mediaTempoCrescente = 0;
			    mediaTempoDecrescente = 0;
			    mediaTempoAleatorio = 0;
			    mediaCompCrescente = 0;
			    mediaCompDecrescente = 0;
			    mediaCompAleatorio = 0;
			    for(y = 0;y<3;y++){
				crescente = gerarCrescente(tamanho[x]);  //retorna o vetor x em ordem crescente
				inicio = System.currentTimeMillis();
				compCrescente = insertionSort(crescente,tamanho[x]);
				fim = System.currentTimeMillis();
				tempo = fim - inicio;
				mediaTempoCrescente += tempo;
				mediaCompCrescente += compCrescente;
				imprimirCrescente(tempo,compCrescente);////Imprime o tempo de execução e quantidade de comparações crescente
				
				//Imprime o tempo de execução e quantidade de comparações decrescente
				decrescente = gerarDecrescente(tamanho[x]);
				inicio = System.currentTimeMillis();
				compDecrescente = insertionSort(decrescente,tamanho[x]);
				fim = System.currentTimeMillis();
				tempo = fim - inicio;
			        mediaTempoDecrescente += tempo;
				mediaCompDecrescente += compDecrescente;
				imprimirDecrescente(tempo, compDecrescente);
			    
				//Imprime o tempo de execução e quantidade de comparações decrescente
				aleatorio = gerarAleatorio(tamanho[x]);
				inicio = System.currentTimeMillis();
				compAleatorio = insertionSort(aleatorio,tamanho[x]);
				fim = System.currentTimeMillis();
				tempo = fim-inicio;
				mediaTempoAleatorio += tempo;
				mediaCompAleatorio += compAleatorio;
				imprimirAleatorio(tempo, compAleatorio);
			    }
			    imprimirMedia(tamanho[x], mediaTempoCrescente, mediaTempoDecrescente, mediaTempoAleatorio, mediaCompCrescente, mediaCompDecrescente, mediaCompAleatorio);
			}
			break;
		    case 3:
			for(x = 0; x <tamanhoVetor;x++){
			    System.out.println("\nNova execução tamanho do vetor = " + tamanho[x] +"");
			    mediaTempoCrescente = 0;
			    mediaTempoDecrescente = 0;
			    mediaTempoAleatorio = 0;
			    mediaCompCrescente = 0;
			    mediaCompDecrescente = 0;
			    mediaCompAleatorio = 0;
			    for(y = 0;y<3;y++){
				countMerge = 0;
				crescente = gerarCrescente(tamanho[x]);  //retorna o vetor x em ordem crescente
				inicio = System.currentTimeMillis();
				mergeSort(crescente, 0, tamanho[x]-1);
				fim = System.currentTimeMillis();
				tempo = fim - inicio;
				mediaTempoCrescente += tempo;
				mediaCompCrescente += countMerge;
				imprimirCrescente(tempo,countMerge);////Imprime o tempo de execução e quantidade de comparações crescente
				
				//Imprime o tempo de execução e quantidade de comparações decrescente
				countMerge = 0;
				decrescente = gerarDecrescente(tamanho[x]);
				inicio = System.currentTimeMillis();
				mergeSort(decrescente, 0, tamanho[x]-1);
				fim = System.currentTimeMillis();
				tempo = fim - inicio;
			        mediaTempoDecrescente += tempo;
				mediaCompDecrescente += countMerge;
				imprimirDecrescente(tempo, countMerge);
			    
				//Imprime o tempo de execução e quantidade de comparações decrescente
				countMerge = 0;
				aleatorio = gerarAleatorio(tamanho[x]);
				inicio = System.currentTimeMillis();
				mergeSort(aleatorio, 0, tamanho[x]-1);
				fim = System.currentTimeMillis();
				tempo = fim-inicio;
				mediaTempoAleatorio += tempo;
				mediaCompAleatorio += countMerge;
				imprimirAleatorio(tempo, countMerge);
			    }
			    imprimirMedia(tamanho[x], mediaTempoCrescente, mediaTempoDecrescente, mediaTempoAleatorio, mediaCompCrescente, mediaCompDecrescente, mediaCompAleatorio);
			}
			break;
		    case 4:
			for(x = 0; x <tamanhoVetor;x++){
			    System.out.println("\nNova execução tamanho do vetor = " + tamanho[x] +"");
			    mediaTempoCrescente = 0;
			    mediaTempoDecrescente = 0;
			    mediaTempoAleatorio = 0;
			    mediaCompCrescente = 0;
			    mediaCompDecrescente = 0;
			    mediaCompAleatorio = 0;
			    for(y = 0;y<3;y++){
				countQuick = 0;
				crescente = gerarCrescente(tamanho[x]);  //retorna o vetor x em ordem crescente
				inicio = System.currentTimeMillis();
				quickSort(crescente, 0, tamanho[x]-1);
				fim = System.currentTimeMillis();
				tempo = fim - inicio;
				mediaTempoCrescente += tempo;
				mediaCompCrescente += countQuick;
				imprimirCrescente(tempo,countQuick);////Imprime o tempo de execução e quantidade de comparações crescente
				
				//Imprime o tempo de execução e quantidade de comparações decrescente
				countQuick = 0;
				decrescente = gerarDecrescente(tamanho[x]);
				inicio = System.currentTimeMillis();
				quickSort(decrescente, 0, tamanho[x]-1);
				fim = System.currentTimeMillis();
				tempo = fim - inicio;
			        mediaTempoDecrescente += tempo;
				mediaCompDecrescente += countQuick;
				imprimirDecrescente(tempo, countQuick);
			    
				//Imprime o tempo de execução e quantidade de comparações decrescente
				countQuick = 0;
				aleatorio = gerarAleatorio(tamanho[x]);
				inicio = System.currentTimeMillis();
				quickSort(aleatorio, 0, tamanho[x]-1);
				fim = System.currentTimeMillis();
				tempo = fim-inicio;
				mediaTempoAleatorio += tempo;
				mediaCompAleatorio += countQuick;
				imprimirAleatorio(tempo, countQuick);
			    }
			    imprimirMedia(tamanho[x], mediaTempoCrescente, mediaTempoDecrescente, mediaTempoAleatorio, mediaCompCrescente, mediaCompDecrescente, mediaCompAleatorio);
			}
			break;
		    case 5:
			for(x = 0; x <tamanhoVetor;x++){
			    System.out.println("\nNova execução tamanho do vetor = " + tamanho[x] +"");
			    mediaTempoCrescente = 0;
			    mediaTempoDecrescente = 0;
			    mediaTempoAleatorio = 0;
			    mediaCompCrescente = 0;
			    mediaCompDecrescente = 0;
			    mediaCompAleatorio = 0;
			    for(y = 0;y<3;y++){
				countHeap = 0;
				crescente = gerarCrescente(tamanho[x]);  //retorna o vetor x em ordem crescente
				inicio = System.currentTimeMillis();
				heapSort(crescente);
				fim = System.currentTimeMillis();
				tempo = fim - inicio;
				mediaTempoCrescente += tempo;
				mediaCompCrescente += countHeap;
				imprimirCrescente(tempo,countHeap);////Imprime o tempo de execução e quantidade de comparações crescente
				
				//Imprime o tempo de execução e quantidade de comparações decrescente
				countHeap = 0;
				decrescente = gerarDecrescente(tamanho[x]);
				inicio = System.currentTimeMillis();
				heapSort(decrescente);
				fim = System.currentTimeMillis();
				tempo = fim - inicio;
			        mediaTempoDecrescente += tempo;
				mediaCompDecrescente += countHeap;
				imprimirDecrescente(tempo, countHeap);
			    
				//Imprime o tempo de execução e quantidade de comparações decrescente
				countHeap = 0;
				aleatorio = gerarAleatorio(tamanho[x]);
				inicio = System.currentTimeMillis();
				heapSort(aleatorio);
				fim = System.currentTimeMillis();
				tempo = fim-inicio;
				mediaTempoAleatorio += tempo;
				mediaCompAleatorio += countHeap;
				imprimirAleatorio(tempo, countHeap);
			    }
			    imprimirMedia(tamanho[x], mediaTempoCrescente, mediaTempoDecrescente, mediaTempoAleatorio, mediaCompCrescente, mediaCompDecrescente, mediaCompAleatorio);
			}
			break;
		}
		System.out.print("\n 0 - Sair\n 1 - Bubble Sort\n 2 - Insertion sort\n 3 - Merge Sort\n 4 - Quick Sort\n 5 - Heap sort");
		escolha = scan.nextInt();
	    }
	}
}
