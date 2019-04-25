package mergesort;

import java.util.Arrays;

/**
 *
 * @author wenderson
 */
public class MergeSort {

   public static void merge(int a[],int p,int q,int r){
       int n1 = q - p +1;
       int n2 = r -q;
       int[] left,right;
       left  = new int[n1+1];
       right = new int[n2+1];
       
       int i=0,j=0,k=0;
       
       for(i=0;i < n1;i++){
	   left[i] = a[p+i];
       }
       for(j=0;j<n2;j++){
	   right[j] = a[q+j+1];
       }
       left[n1]  = 100000;
       right[n2] = 100000;
       i = 0;
       j = 0;
       
       for(k=p;k<=r;k++){
	   if(left[i] <= right[j]){
		a[k] = left[i];
		i = i+1;
	   }else{
		a[k] = right[j];
		j = j+1;
	   }
       }
       System.out.println(Arrays.toString(a));

    } 
   
    public static void mergeSort(int a[],int p,int r){
	int q;
	if(p < r){
	    q = (p+r)/2;
	    mergeSort(a,p,q);
	    mergeSort(a,q+1,r);
	    merge(a,p,q,r);
	}
    }
    
    public static void main(String[] args) {
		int[] a = {4,6,2,1,7,3,8,5,9,10};
		int p = 0; //Posição inicial do vetor
		int r = a.length; //Posição maxima do vetor
		System.out.println(Arrays.toString(a));
		mergeSort(a, p,r-1);
		System.out.println(Arrays.toString(a));
	}
}
