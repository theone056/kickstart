<script>
    export let address;
    export let description;
</script>

<div class="card-container">
    <p>{address}</p>
    <a href="#">{description}</a>
</div>


<style>
    .card-container{
        border:1px solid rgb(206, 206, 206);
        margin: 0 auto;
        padding: 10px;
    }
</style>