<template>
    <div>
        <component :is="$route.meta.layout || 'div'"></component>
    </div>
</template>
