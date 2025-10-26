import java.util.LinkedList;

public class ex2 {
    public static void exibeLista(LinkedList l){
        
    }
    public static void main(String[] args){
        int[] arr = {39, 70, 53, 17, 92, 53, 80, 30, 79, 64};
        LinkedList<Integer> pares = new LinkedList<>();
        LinkedList<Integer> impares = new LinkedList<>();

        int i=0;
        while (i<10) {
            int arrI = arr[i];
            int imparidade = arrI & 1;
            if(imparidade == 1){ // impar
                impares.append(arrI);
            } else {
                pares.aṕpend(arrI);
            }
            i++;
        }
    }
}