<template>
    <div
        class="flex flex-col items-center gap-2 p-2 transition-all duration-300 ease-in-out"
    >
        <div class="flex items-center justify-between px-4">
            <h1
                class="text-lg font-black tracking-widest text-center uppercase text-slate-900"
            >
                KKPR Data
            </h1>
        </div>
        <hr class="border-t-2 border-green-500" />
        <div class="flex items-center justify-start w-full space-x-2">
            <Pie
                :data="datas"
                :options="options"
                :chartData="chartData"
                :colors="colors"
            />
        </div>
        <div>
            <span class="text-xs font-bold tracking-widest uppercase"
                >Chart Legends :</span
            >
            <div v-for="(legend, index) in legends" :key="index">
                <table>
                    <tr>
                        <td>
                            <div
                                :style="{
                                    backgroundColor: legend.color,
                                }"
                                class="w-4 h-4 mr-2 rounded-full"
                            ></div>
                        </td>
                        <td class="text-xs font-medium tracking-tight">
                            {{ legend.label }} ({{
                                legend.percentage.toFixed(3)
                            }}%)
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</template>

<script>
import { Pie } from "vue-chartjs";
import { Chart, ArcElement, Tooltip } from "chart.js";
Chart.register(ArcElement, Tooltip);

export default {
    components: {
        Pie,
    },
    data() {
        return {
            options: {
                responsive: true,
                maintainAspectRatio: false,
                legend: {
                    display: false,
                },
            },
            datas: null,
            legends: [],
        };
    },
    created() {
        const labels = [];
        const percentages = [];
        this.chartData.forEach((data) => {
            labels.push(data.namobj);
            percentages.push(data.clipped_percentage);
        });

        const labelColors = [];
        labels.forEach((label, index) => {
            this.colors.forEach((item, colorIndex) => {
                percentages.forEach((percentage, percentageIndex) => {
                    if (index === colorIndex && index === percentageIndex) {
                        this.legends.push({
                            label: item.name,
                            color: item.color,
                            percentage: percentage,
                        });
                        labelColors.push(item.color);
                    }
                });
            });
        });

        this.datas = {
            labels: labels,
            datasets: [
                {
                    label: "Percentage",
                    backgroundColor: labelColors,
                    borderWidth: 1,
                    data: percentages,
                },
            ],
        };
    },
    props: {
        chartData: {
            type: Object,
            required: true,
        },
        colors: {
            type: Array,
            required: true,
        },
    },
};
</script>
