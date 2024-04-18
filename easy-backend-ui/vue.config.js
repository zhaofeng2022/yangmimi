module.exports = {
    publicPath: process.env.NODE_ENV === 'production' ? './' : '/',
    devServer: {
        proxy: process.env.VUE_APP_BASEURL
    }
}