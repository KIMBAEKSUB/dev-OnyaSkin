<template>
    <div class="px_20 space_01" v-if="pageName == 'Event'">
        <div>
            <li class="e_table py_15">
                <div class="text-center e_table_no">No</div>
                <div class="text-center e_table_title">Title</div>
                <div class="text-center e_table_created_time">Time</div>
                <div class="text-center e_table_opened">Count</div>
            </li>
            <li class="e_table_body py_15">
                <div class="text-center e_table_body_no">1</div>
                <div class="text-center e_table_body_title px_15">Event</div>
                <div class="text-center e_table_body_created_time fc_gray_05">2020-02-01</div>
                <div class="text-center e_table_body_opened fc_gray_05">0</div>
            </li>
        </div>
    </div>
</template>
<script>
export default {
    props: {
        pageName: {
            type: String,
        }
    }
}
</script>
<style scoped>


</style>