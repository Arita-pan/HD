<script setup>
import { ref } from 'vue'

const todoId = ref(0)
const todolist = ref([])
const todoitem = ref('')
const complete = ref(false)

function add() {
  todolist.value.push({
    id: todoId.value++,
    item: todoitem.value,
    status: complete.value
  })
  todoitem.value = ""
}

function remove(todo) {
  todolist.value = todolist.value.filter((t) => t !== todo)
}

</script>

<template>
  <div>
    <h1>To Do List</h1>
    <form>
      <input type="text" placeholder="e.g. Grocery" v-model="todoitem">
      <button class="buttonstyle" @click="add" type="button" value="Add">Add</button>
    </form>
    <ul>
      <li v-for="i in todolist" :key="i.id" >
      <input type="checkbox" v-model ="i.complete" class="crossout" value="checkbox">
      <span :class="{done: i.complete}">{{ i.item }}</span>
      <button @click="remove(i)" type="button" class="remove">x</button>
        
      </li>
    </ul>
  </div>
</template>

<style>


body{
  background-color: darkgray;
  font-family: 'Courier New', Courier, monospace;
  text-align: center;
}

h1 {
  margin-bottom: 30px;
}

input {
  margin-bottom: 10px;;
}

button:hover{
  background-color: red;
}


</style>
