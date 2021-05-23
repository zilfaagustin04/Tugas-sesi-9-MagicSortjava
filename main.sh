package sort;

import java.util.concurrent.TimeUnit;
import java.util.Arrays;
import java.util.Collections;

public class MagicSort {
    private Integer toBeSort[] = {};
    private Integer resultSort[] = {};
    private long countSwap = 0;
    private long executionTime = 0;

    public MagicSort(Integer toBeSort[]) {
        this.toBeSort = toBeSort;
    }

    /**
     * Implement manual sort
     * @return
     */

    public MagicSort manualAsc() {
        this.resultSort = null;
        this.executionTime = 0;
        this.countSwap = 0;

        long startTime = System.nanoTime();
        Integer manipulate[] = this.toBeSort;
        for(int i  = 0; i < manipulate.length - 1; i++) {
            Integer minIdx = i;
            for (int j = i + 1; j < manipulate.length; j++) {
                if(manipulate[j] < manipulate[minIdx]) {
                    minIdx = j;
                }
            }
            Integer tempArr = manipulate[minIdx];
            // swap 1
            manipulate[minIdx] = manipulate[i];
            // swap 2
            manipulate[i] = tempArr;
            if(manipulate[i] != this.toBeSort[i]) {
                this.countSwap = this.countSwap + 2;
            }
        }
        this.resultSort = manipulate;
        long endTime = System.nanoTime();
        this.executionTime = (endTime - startTime);
        return this;
    }

    public MagicSort manualDesc() {
        this.resultSort = null;
        this.executionTime = 0;
        this.countSwap = 0;

        long startTime = System.nanoTime();
        Integer manipulate[] = this.toBeSort;
        for(int i  = 0; i < manipulate.length - 1; i++) {
            Integer minIdx = i;
            for (int j = i + 1; j < manipulate.length; j++) {
                if(manipulate[j] > manipulate[minIdx]) {
                    minIdx = j;
                }
            }
            Integer tempArr = manipulate[minIdx];
            // swap 1
            manipulate[minIdx] = manipulate[i];
            // swap 2
            manipulate[i] = tempArr;
            this.countSwap = this.countSwap + 2;
        }
        this.resultSort = manipulate;
        long endTime = System.nanoTime();
        this.executionTime = (endTime - startTime);
        return this;
    }

    public MagicSort autoAsc() {
        this.resultSort = null;
        this.executionTime = 0;
        this.countSwap = 0;

        long startTime = System.nanoTime();
        Integer needToSort[] = this.toBeSort;
        Arrays.sort(needToSort);
        this.resultSort = needToSort;
        long endTime = System.nanoTime();
        this.executionTime = (endTime - startTime);
        return this;
    }

    /**
     * Implement builitin sort
     * @return
     */
    public MagicSort autoDesc() {
        this.resultSort = null;
        this.executionTime = 0;
        this.countSwap = 0;

        long startTime = System.nanoTime();
        this.resultSort = null;
        Integer needToSort[] = this.toBeSort;
        Arrays.sort(needToSort, Collections.reverseOrder());
        this.resultSort = needToSort;
        long endTime = System.nanoTime();
        this.executionTime = (endTime - startTime);
        return this;
    }


    public Integer[] getResult() {
        return this.resultSort;
    }

    public double getExecutionTime(boolean normalize) {
        if(normalize) {
            return (double)TimeUnit.SECONDS.convert(this.executionTime, TimeUnit.NANOSECONDS);
        }
        return this.executionTime;
    }

    public long getTotalSwaped() {
        return this.countSwap;
    }

}