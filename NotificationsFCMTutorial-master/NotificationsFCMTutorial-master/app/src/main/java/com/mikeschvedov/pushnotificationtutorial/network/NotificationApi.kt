package com.mikeschvedov.pushnotificationtutorial.network

import com.mikeschvedov.pushnotificationtutorial.models.PushNotification
import okhttp3.ResponseBody
import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.Headers
import retrofit2.http.POST

interface NotificationApi {
    companion object{
        const val CONTENT_TYPE = "application/json"
        const val API_KEY = "AAAAoZwE9uc:APA91bHkyIn2qKMa57xklVazajphewot7TTsdxtyAPL0B57N8y_iqU4swMHaw4qTt4sVQBBJTTr6Et3sPcVDsJSh-nxi4i26iWWWeYYLvXAkzbZ_jlryF7Pp1oa-iOMNT2XqWOtMVv16"
    }

    @Headers("Authorization: key=${API_KEY}", "Content-Type: $CONTENT_TYPE")
    @POST("fcm/send")
    suspend fun postNotification(
        @Body notification: PushNotification
    ): Response<ResponseBody>
}
