const cds = require('@sap/cds')
module.exports = async (srv) => {
    const reviews_srv = await cds.connect.to('sap.capire.reviews.ReviewsService')

    // react on event messages from reviews service
    reviews_srv.on('positiveReviewCreated', (msg) => {
        console.debug('> received', msg)
    })

}
