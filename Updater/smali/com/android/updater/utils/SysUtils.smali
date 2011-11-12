.class public Lcom/android/updater/utils/SysUtils;
.super Ljava/lang/Object;
.source "SysUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addAccount(Landroid/content/Context;Landroid/accounts/AccountManagerCallback;)V
    .locals 10
    .parameter "paramContext"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/accounts/AccountManagerCallback",
            "<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, callback:Landroid/accounts/AccountManagerCallback;,"Landroid/accounts/AccountManagerCallback<Landroid/os/Bundle;>;"
    const/4 v4, 0x0

    const-string v2, "com.miui.auth"

    .line 113
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    .line 114
    .local v1, localAccountManager:Landroid/accounts/AccountManager;
    const-string v3, "com.miui.auth"

    invoke-virtual {v1, v2}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v9

    check-cast v9, [Landroid/accounts/Account;

    .line 115
    .local v9, arrayOfAccount:[Landroid/accounts/Account;
    array-length v3, v9

    if-lez v3, :cond_0

    .line 116
    const/4 v3, 0x0

    aget-object v3, v9, v3

    invoke-virtual {v1, v3, v4, v4}, Landroid/accounts/AccountManager;->removeAccount(Landroid/accounts/Account;Landroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;

    .line 118
    :cond_0
    const-string v3, "com.miui.auth"

    const-string v3, "miuiToken"

    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    move-object v6, v0

    move-object v5, v4

    move-object v7, p1

    move-object v8, v4

    invoke-virtual/range {v1 .. v8}, Landroid/accounts/AccountManager;->addAccount(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/os/Bundle;Landroid/app/Activity;Landroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;

    .line 120
    return-void
.end method

.method public static appendVersionInfo(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter "context"
    .parameter "url"

    .prologue
    .line 57
    invoke-static {}, Lcom/android/updater/utils/SysUtils;->getShortIMEI()Ljava/lang/String;

    move-result-object v0

    .line 58
    .local v0, imeiParam:Ljava/lang/String;
    invoke-static {p0}, Lcom/android/updater/utils/SysUtils;->getMIUIAccountToken(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 60
    .local v1, token:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "%s?g=%s&v=%s&b=%s&d=%s&i=%s"

    const/4 v4, 0x6

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x1

    invoke-static {p0}, Lcom/android/updater/utils/SysUtils;->getUserId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    invoke-static {}, Lcom/android/updater/utils/SysUtils;->getModVersion()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x3

    invoke-static {}, Lcom/android/updater/utils/SysUtils;->getBoardString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x4

    invoke-static {}, Lcom/android/updater/utils/SysUtils;->getDeviceString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x5

    aput-object v0, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz v1, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "&t="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_0
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    :cond_0
    const-string v3, ""

    goto :goto_0
.end method

.method public static bootRecovery(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 157
    const-string v0, "power"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Landroid/os/PowerManager;

    const/4 v0, 0x0

    const/4 v1, 0x1

    const-string v2, "recovery"

    invoke-virtual {p0, v0, v1, v2}, Landroid/os/PowerManager;->shutdown(ZZLjava/lang/String;)V

    .line 158
    return-void
.end method

.method public static canFileBeDeleted(Ljava/io/File;)Z
    .locals 7
    .parameter "file"

    .prologue
    const/4 v6, 0x0

    .line 284
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    move v2, v6

    .line 294
    :goto_0
    return v2

    .line 287
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    .line 288
    .local v0, lastModifiedTime:J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_2

    .line 289
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    const-wide v4, 0x9a7ec800L

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    .line 291
    const/4 v2, 0x1

    goto :goto_0

    :cond_2
    move v2, v6

    .line 294
    goto :goto_0
.end method

.method public static cancelNotification(Landroid/content/Context;I)V
    .locals 2
    .parameter "context"
    .parameter "notifyId"

    .prologue
    .line 363
    const-string v1, "notification"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 364
    .local v0, notificationManager:Landroid/app/NotificationManager;
    invoke-virtual {v0, p1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 365
    return-void
.end method

.method public static checkExistingRomFile(Lcom/android/updater/customTypes/UpdateInfo;)Ljava/io/File;
    .locals 6
    .parameter "updateInfo"

    .prologue
    const/4 v5, 0x0

    .line 428
    if-nez p0, :cond_0

    move-object v3, v5

    .line 441
    :goto_0
    return-object v3

    .line 430
    :cond_0
    invoke-virtual {p0}, Lcom/android/updater/customTypes/UpdateInfo;->getFileName()Ljava/lang/String;

    move-result-object v2

    .line 431
    .local v2, updateRomName:Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v3, v5

    .line 432
    goto :goto_0

    .line 435
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/updater/misc/Constants;->ROM_FOLDER:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 436
    .local v1, romPath:Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 437
    .local v0, romFile:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    move-object v3, v0

    .line 438
    goto :goto_0

    :cond_2
    move-object v3, v5

    .line 441
    goto :goto_0
.end method

.method public static checkXiaomiAccountToken(Landroid/content/Context;)V
    .locals 4
    .parameter "context"

    .prologue
    const/4 v3, 0x0

    .line 86
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    .line 87
    .local v0, accountManager:Landroid/accounts/AccountManager;
    const-string v2, "com.miui.auth"

    invoke-virtual {v0, v2}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v1

    .line 89
    .local v1, accounts:[Landroid/accounts/Account;
    array-length v2, v1

    if-lez v2, :cond_0

    .line 90
    const/4 v2, 0x0

    aget-object v2, v1, v2

    invoke-virtual {v0, v2, v3, v3}, Landroid/accounts/AccountManager;->checkXiaomiAccountToken(Landroid/accounts/Account;Landroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;

    .line 92
    :cond_0
    return-void
.end method

.method public static deleteTrashFiles(Ljava/io/File;)V
    .locals 6
    .parameter "dir"

    .prologue
    .line 298
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-nez v5, :cond_1

    .line 309
    :cond_0
    return-void

    .line 301
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 302
    .local v2, files:[Ljava/io/File;
    if-eqz v2, :cond_0

    .line 303
    move-object v0, v2

    .local v0, arr$:[Ljava/io/File;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v1, v0, v3

    .line 304
    .local v1, file:Ljava/io/File;
    invoke-static {v1}, Lcom/android/updater/utils/SysUtils;->canFileBeDeleted(Ljava/io/File;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 305
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 303
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public static displayDebugOutput()Z
    .locals 1

    .prologue
    .line 277
    const/4 v0, 0x0

    return v0
.end method

.method public static downloadUpdate(Landroid/content/Context;ZLcom/android/updater/customTypes/UpdateInfo;)Z
    .locals 9
    .parameter "context"
    .parameter "isHidden"
    .parameter "updateInfo"

    .prologue
    .line 379
    if-nez p2, :cond_0

    .line 380
    const/4 p0, 0x0

    .line 418
    .end local p0
    .end local p2
    :goto_0
    return p0

    .line 383
    .restart local p0
    .restart local p2
    :cond_0
    const/4 v1, 0x0

    .line 384
    .local v1, canDownload:Z
    const v6, 0x7f06001b

    .line 385
    .local v6, titleRes:I
    const v0, 0x7f06001a

    .line 386
    .local v0, bodyRes:I
    invoke-static {}, Landroid/os/Environment;->isExternalStorageMounted()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 388
    :try_start_0
    invoke-virtual {p2}, Lcom/android/updater/customTypes/UpdateInfo;->getFileSize()Ljava/lang/String;

    move-result-object v2

    .line 389
    .local v2, filesize:Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 390
    const/4 p0, 0x0

    goto :goto_0

    .line 392
    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    .line 393
    .local v4, length:I
    const/4 v3, 0x1

    sub-int v3, v4, v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v5, 0x4d

    if-ne v3, v5, :cond_4

    const/4 v3, 0x1

    .line 395
    .local v3, isM:Z
    :goto_1
    const/4 v5, 0x0

    const/4 v7, 0x1

    sub-int/2addr v4, v7

    invoke-virtual {v2, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .end local v4           #length:I
    move-result-object v2

    .line 396
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 397
    .local v4, needInKB:J
    if-eqz v3, :cond_6

    .line 398
    const-wide/16 v2, 0x400

    mul-long/2addr v2, v4

    .line 400
    .end local v3           #isM:Z
    .end local v4           #needInKB:J
    .local v2, needInKB:J
    :goto_2
    const-wide/16 v4, 0x400

    mul-long/2addr v2, v4

    long-to-double v2, v2

    const-wide v4, 0x3ff199999999999aL

    mul-double/2addr v2, v4

    double-to-long v2, v2

    invoke-static {v2, v3}, Lcom/android/updater/utils/SysUtils;->enoughSpaceOnSdCard(J)Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v2           #needInKB:J
    move-result v1

    .line 401
    if-eqz v1, :cond_5

    .line 402
    :try_start_1
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/updater/misc/Constants;->ROM_FOLDER:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Lcom/android/updater/customTypes/UpdateInfo;->getFileName()Ljava/lang/String;

    move-result-object p2

    .end local p2
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 403
    .local v2, foo:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result p2

    if-eqz p2, :cond_2

    .line 404
    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    :cond_2
    move p2, v0

    .end local v0           #bodyRes:I
    .local p2, bodyRes:I
    move v0, v6

    .end local v2           #foo:Ljava/io/File;
    .end local v6           #titleRes:I
    .local v0, titleRes:I
    :goto_3
    move v8, v0

    .end local v0           #titleRes:I
    .local v8, titleRes:I
    move v0, v1

    .end local v1           #canDownload:Z
    .local v0, canDownload:Z
    move v1, v8

    .line 415
    .end local v8           #titleRes:I
    .local v1, titleRes:I
    :goto_4
    if-nez v0, :cond_3

    if-nez p1, :cond_3

    .line 416
    invoke-static {p0, v1, p2}, Lcom/android/updater/utils/SysUtils;->showDialog(Landroid/content/Context;II)V

    :cond_3
    move p0, v0

    .line 418
    goto/16 :goto_0

    .line 393
    .local v0, bodyRes:I
    .local v1, canDownload:Z
    .local v2, filesize:Ljava/lang/String;
    .local v4, length:I
    .restart local v6       #titleRes:I
    .local p2, updateInfo:Lcom/android/updater/customTypes/UpdateInfo;
    :cond_4
    const/4 v3, 0x0

    goto :goto_1

    .line 407
    .end local v2           #filesize:Ljava/lang/String;
    .end local v4           #length:I
    :cond_5
    const v0, 0x7f06001d

    .line 408
    .end local v6           #titleRes:I
    .local v0, titleRes:I
    const p2, 0x7f06001c

    .local p2, bodyRes:I
    goto :goto_3

    .line 410
    .local v0, bodyRes:I
    .restart local v6       #titleRes:I
    .local p2, updateInfo:Lcom/android/updater/customTypes/UpdateInfo;
    :catch_0
    move-exception p2

    move p2, v1

    .end local v1           #canDownload:Z
    .local p2, canDownload:Z
    :goto_5
    move v1, v6

    .end local v6           #titleRes:I
    .local v1, titleRes:I
    move v8, v0

    .end local v0           #bodyRes:I
    .local v8, bodyRes:I
    move v0, p2

    .end local p2           #canDownload:Z
    .local v0, canDownload:Z
    move p2, v8

    .end local v8           #bodyRes:I
    .local p2, bodyRes:I
    goto :goto_4

    .end local p2           #bodyRes:I
    .local v0, bodyRes:I
    .local v1, canDownload:Z
    .restart local v6       #titleRes:I
    :catch_1
    move-exception p2

    move p2, v1

    .end local v1           #canDownload:Z
    .local p2, canDownload:Z
    goto :goto_5

    .restart local v1       #canDownload:Z
    .restart local v2       #filesize:Ljava/lang/String;
    .restart local v3       #isM:Z
    .local v4, needInKB:J
    .local p2, updateInfo:Lcom/android/updater/customTypes/UpdateInfo;
    :cond_6
    move-wide v2, v4

    .end local v3           #isM:Z
    .end local v4           #needInKB:J
    .local v2, needInKB:J
    goto :goto_2

    .end local v2           #needInKB:J
    :cond_7
    move p2, v0

    .end local v0           #bodyRes:I
    .local p2, bodyRes:I
    move v0, v1

    .end local v1           #canDownload:Z
    .local v0, canDownload:Z
    move v1, v6

    .end local v6           #titleRes:I
    .local v1, titleRes:I
    goto :goto_4
.end method

.method public static enoughSpaceOnSdCard(J)Z
    .locals 10
    .parameter "UpdateSize"

    .prologue
    const/4 v9, 0x0

    .line 146
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v6

    .line 147
    .local v6, status:Ljava/lang/String;
    const-string v7, "mounted"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    move v7, v9

    .line 153
    :goto_0
    return v7

    .line 149
    :cond_0
    sget-object v4, Lcom/android/updater/misc/Constants;->SDCARD_FOLDER:Ljava/io/File;

    .line 150
    .local v4, path:Ljava/io/File;
    new-instance v5, Landroid/os/StatFs;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 151
    .local v5, stat:Landroid/os/StatFs;
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockSize()I

    move-result v7

    int-to-long v2, v7

    .line 152
    .local v2, blockSize:J
    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v7

    int-to-long v0, v7

    .line 153
    .local v0, availableBlocks:J
    mul-long v7, v0, v2

    cmp-long v7, p0, v7

    if-gez v7, :cond_1

    const/4 v7, 0x1

    goto :goto_0

    :cond_1
    move v7, v9

    goto :goto_0
.end method

.method public static getBoardString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 138
    sget-object v0, Landroid/os/Build;->BOARD:Ljava/lang/String;

    return-object v0
.end method

.method public static getDeviceString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 142
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    return-object v0
.end method

.method private static getIMEI()Ljava/lang/String;
    .locals 2

    .prologue
    .line 216
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    .line 217
    .local v0, imei:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 218
    const-string v1, ""

    .line 221
    :goto_0
    return-object v1

    :cond_0
    move-object v1, v0

    goto :goto_0
.end method

.method public static getIncrementalVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    sget-object v0, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    return-object v0
.end method

.method public static getMIUIAccountToken(Landroid/content/Context;)Ljava/lang/String;
    .locals 7
    .parameter "context"

    .prologue
    .line 95
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    .line 96
    .local v0, accountManager:Landroid/accounts/AccountManager;
    const-string v5, "com.miui.auth"

    invoke-virtual {v0, v5}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v1

    .line 98
    .local v1, accounts:[Landroid/accounts/Account;
    const/4 v3, 0x0

    .line 99
    .local v3, token:Ljava/lang/String;
    array-length v5, v1

    if-lez v5, :cond_0

    .line 101
    const/4 v5, 0x0

    :try_start_0
    aget-object v5, v1, v5

    const-string v6, "token"

    invoke-virtual {v0, v5, v6}, Landroid/accounts/AccountManager;->getUserData(Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 102
    .local v4, userData:Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 103
    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 109
    .end local v4           #userData:Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v3

    .line 105
    :catch_0
    move-exception v5

    move-object v2, v5

    .line 106
    .local v2, e:Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v2}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method public static getModVersion()Ljava/lang/String;
    .locals 2

    .prologue
    .line 126
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MIUI-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/android/updater/utils/SysUtils;->getIncrementalVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRomPath(Lcom/android/updater/customTypes/UpdateInfo;)Ljava/lang/String;
    .locals 4
    .parameter "updateInfo"

    .prologue
    const/4 v3, 0x0

    .line 445
    if-nez p0, :cond_0

    move-object v2, v3

    .line 452
    :goto_0
    return-object v2

    .line 447
    :cond_0
    invoke-virtual {p0}, Lcom/android/updater/customTypes/UpdateInfo;->getFileName()Ljava/lang/String;

    move-result-object v1

    .line 448
    .local v1, updateRomName:Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    move-object v2, v3

    .line 449
    goto :goto_0

    .line 451
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/android/updater/misc/Constants;->ROM_FOLDER:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .local v0, romPath:Ljava/lang/String;
    move-object v2, v0

    .line 452
    goto :goto_0
.end method

.method public static getRomUpdateFileURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    const-string v0, "http://ota.miui.cz/update.php"

    return-object v0
.end method

.method public static getShortIMEI()Ljava/lang/String;
    .locals 5

    .prologue
    const/16 v4, 0x9

    .line 197
    const/16 v0, 0x9

    .line 199
    .local v0, LENGTH:I
    invoke-static {}, Lcom/android/updater/utils/SysUtils;->getIMEI()Ljava/lang/String;

    move-result-object v2

    .line 200
    .local v2, shortImei:Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 201
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    .line 203
    .local v1, length:I
    if-lt v1, v4, :cond_0

    .line 204
    sub-int v3, v1, v4

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 208
    .end local v1           #length:I
    :cond_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, ""

    :goto_0
    return-object v3

    :cond_1
    move-object v3, v2

    goto :goto_0
.end method

.method public static getUserId(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .parameter "context"

    .prologue
    .line 134
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "android_id"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getVersionUploadURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    const-string v0, "http://ota.miui.cz/update.php"

    return-object v0
.end method

.method public static isCheckUpdateOnlyWifiAvailable(Landroid/content/Context;)Z
    .locals 4
    .parameter "context"

    .prologue
    const/4 v3, 0x1

    .line 231
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "check_update_only_wifi_available"

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 233
    .local v0, check:I
    if-ne v0, v3, :cond_0

    move v1, v3

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isConnectivityActive(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 72
    const-string v1, "connectivity"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 74
    .local v0, cm:Landroid/net/ConnectivityManager;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isUserAllowLog(Landroid/content/Context;)Z
    .locals 4
    .parameter "context"

    .prologue
    const/4 v3, 0x1

    .line 225
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "upload_log_pref"

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 227
    .local v0, allow:I
    if-eqz v0, :cond_0

    move v1, v3

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isWifiConnected(Landroid/content/Context;)Z
    .locals 4
    .parameter "context"

    .prologue
    const/4 v3, 0x1

    .line 78
    const-string v2, "connectivity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 80
    .local v0, connManager:Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 81
    .local v1, networkInfo:Landroid/net/NetworkInfo;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    if-ne v2, v3, :cond_0

    move v2, v3

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static runCommand(Ljava/lang/String;)Z
    .locals 13
    .parameter "cmd"

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    const-string v12, "Unable to run command, %s"

    const-string v11, "SysUtils"

    .line 161
    const/4 v4, 0x1

    .line 162
    .local v4, failed:Z
    const-string v5, "Unknown"

    .line 165
    .local v5, message:Ljava/lang/String;
    const/4 v7, 0x3

    :try_start_0
    new-array v1, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "sh"

    aput-object v8, v1, v7

    const/4 v7, 0x1

    const-string v8, "-c"

    aput-object v8, v1, v7

    const/4 v7, 0x2

    aput-object p0, v1, v7

    .line 169
    .local v1, command:[Ljava/lang/String;
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v6

    .line 170
    .local v6, p:Ljava/lang/Process;
    invoke-virtual {v6}, Ljava/lang/Process;->waitFor()I

    move-result v7

    if-eqz v7, :cond_1

    move v4, v10

    .line 171
    :goto_0
    if-eqz v4, :cond_0

    .line 172
    const/16 v7, 0x400

    new-array v0, v7, [B

    .line 173
    .local v0, bytes:[B
    invoke-virtual {v6}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 174
    .local v2, count:I
    new-instance v5, Ljava/lang/String;

    .end local v5           #message:Ljava/lang/String;
    const/4 v7, 0x0

    invoke-direct {v5, v0, v7, v2}, Ljava/lang/String;-><init>([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 184
    .end local v0           #bytes:[B
    .end local v1           #command:[Ljava/lang/String;
    .end local v2           #count:I
    .end local v6           #p:Ljava/lang/Process;
    .restart local v5       #message:Ljava/lang/String;
    :cond_0
    :goto_1
    return v4

    .restart local v1       #command:[Ljava/lang/String;
    .restart local v6       #p:Ljava/lang/Process;
    :cond_1
    move v4, v9

    .line 170
    goto :goto_0

    .line 176
    .end local v1           #command:[Ljava/lang/String;
    .end local v5           #message:Ljava/lang/String;
    .end local v6           #p:Ljava/lang/Process;
    :catch_0
    move-exception v7

    move-object v3, v7

    .line 177
    .local v3, e:Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    .line 178
    .restart local v5       #message:Ljava/lang/String;
    const-string v7, "SysUtils"

    const-string v7, "Unable to run command, %s"

    new-array v7, v10, [Ljava/lang/Object;

    aput-object v5, v7, v9

    invoke-static {v12, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v11, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 179
    .end local v3           #e:Ljava/io/IOException;
    .end local v5           #message:Ljava/lang/String;
    :catch_1
    move-exception v7

    move-object v3, v7

    .line 180
    .local v3, e:Ljava/lang/InterruptedException;
    invoke-virtual {v3}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v5

    .line 181
    .restart local v5       #message:Ljava/lang/String;
    const-string v7, "SysUtils"

    const-string v7, "Unable to run command, %s"

    new-array v7, v10, [Ljava/lang/Object;

    aput-object v5, v7, v9

    invoke-static {v12, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v11, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public static setCheckUpdateOnlyWifiAvailable(Landroid/content/Context;Z)V
    .locals 3
    .parameter "context"
    .parameter "isCheckUpdateOnlyWifiAvailable"

    .prologue
    .line 237
    if-eqz p1, :cond_0

    const/4 v1, 0x1

    move v0, v1

    .line 238
    .local v0, check:I
    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "check_update_only_wifi_available"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 240
    return-void

    .line 237
    .end local v0           #check:I
    :cond_0
    const/4 v1, 0x0

    move v0, v1

    goto :goto_0
.end method

.method public static showBubble(Landroid/content/Context;I)V
    .locals 4
    .parameter "context"
    .parameter "iconId"

    .prologue
    .line 247
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.APPLICATION_MESSAGE_UPDATE"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 248
    .local v0, intent:Landroid/content/Intent;
    const-string v2, "android.intent.extra.update_application_flatten_name"

    const-string v3, "com.android.updater/.MainActivity"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 251
    if-lez p1, :cond_0

    const-string v2, " "

    move-object v1, v2

    .line 252
    .local v1, message:Ljava/lang/String;
    :goto_0
    const-string v2, "android.intent.extra.update_application_message"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 253
    const-string v2, "android.intent.extra.update_application_message_background"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 254
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 255
    return-void

    .line 251
    .end local v1           #message:Ljava/lang/String;
    :cond_0
    const/4 v2, 0x0

    move-object v1, v2

    goto :goto_0
.end method

.method public static showDialog(Landroid/content/Context;II)V
    .locals 1
    .parameter "context"
    .parameter "titleRes"
    .parameter "bodyRes"

    .prologue
    .line 258
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/android/updater/utils/SysUtils;->showDialog(Landroid/content/Context;ILjava/lang/String;)V

    .line 259
    return-void
.end method

.method public static showDialog(Landroid/content/Context;ILjava/lang/String;)V
    .locals 4
    .parameter "context"
    .parameter "titleRes"
    .parameter "body"

    .prologue
    .line 262
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f060026

    new-instance v3, Lcom/android/updater/utils/SysUtils$1;

    invoke-direct {v3}, Lcom/android/updater/utils/SysUtils$1;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 270
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    if-eqz p1, :cond_0

    .line 271
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 273
    :cond_0
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 274
    return-void
.end method

.method public static showNotification(Landroid/content/Context;Landroid/content/Intent;IIILjava/lang/String;)V
    .locals 6
    .parameter "context"
    .parameter "intent"
    .parameter "iconRes"
    .parameter "titleRes"
    .parameter "bodyTitleRes"
    .parameter "body"

    .prologue
    .line 334
    invoke-virtual {p0, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p5

    invoke-static/range {v0 .. v5}, Lcom/android/updater/utils/SysUtils;->showNotification(Landroid/content/Context;Landroid/content/Intent;IILjava/lang/String;Ljava/lang/String;)V

    .line 335
    return-void
.end method

.method public static showNotification(Landroid/content/Context;Landroid/content/Intent;IIILjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .parameter "context"
    .parameter "intent"
    .parameter "notificationId"
    .parameter "iconRes"
    .parameter "titleRes"
    .parameter "bodyTitle"
    .parameter "body"

    .prologue
    .line 317
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 318
    .local v3, res:Landroid/content/res/Resources;
    const/4 v4, 0x0

    const/high16 v5, 0x4000

    invoke-static {p0, v4, p1, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 321
    .local v0, contentIntent:Landroid/app/PendingIntent;
    new-instance v1, Landroid/app/Notification;

    invoke-virtual {v3, p4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-direct {v1, p3, v4, v5, v6}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 325
    .local v1, notification:Landroid/app/Notification;
    const/16 v4, 0x10

    iput v4, v1, Landroid/app/Notification;->flags:I

    .line 326
    invoke-virtual {v1, p0, p5, p6, v0}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 327
    const/4 v4, 0x4

    iput v4, v1, Landroid/app/Notification;->defaults:I

    .line 329
    const-string v4, "notification"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/NotificationManager;

    .line 330
    .local v2, notificationManager:Landroid/app/NotificationManager;
    invoke-virtual {v2, p2, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 331
    return-void
.end method

.method public static showNotification(Landroid/content/Context;Landroid/content/Intent;IILjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .parameter "context"
    .parameter "intent"
    .parameter "iconRes"
    .parameter "titleRes"
    .parameter "bodyTitle"
    .parameter "body"

    .prologue
    .line 312
    move-object v0, p0

    move-object v1, p1

    move v2, p3

    move v3, p2

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-static/range {v0 .. v6}, Lcom/android/updater/utils/SysUtils;->showNotification(Landroid/content/Context;Landroid/content/Intent;IIILjava/lang/String;Ljava/lang/String;)V

    .line 313
    return-void
.end method

.method public static showNotification(Landroid/content/Context;Lcom/android/updater/customTypes/UpdateInfo;Ljava/lang/String;II)V
    .locals 7
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 338
    if-nez p1, :cond_0

    .line 360
    :goto_0
    return-void

    .line 342
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 343
    invoke-virtual {p1}, Lcom/android/updater/customTypes/UpdateInfo;->getFileName()Ljava/lang/String;

    move-result-object v0

    move-object v5, v0

    .line 346
    :goto_1
    new-instance v1, Landroid/content/Intent;

    const-class v0, Lcom/android/updater/ApplyUpdateActivity;

    invoke-direct {v1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 347
    invoke-static {p0, p1}, Lcom/android/updater/utils/StringUtils;->getModName(Landroid/content/Context;Lcom/android/updater/customTypes/UpdateInfo;)Ljava/lang/String;

    move-result-object v0

    .line 348
    invoke-static {p1}, Lcom/android/updater/ApplyUpdateActivity;->setUpdateInfo(Lcom/android/updater/customTypes/UpdateInfo;)V

    .line 349
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/updater/misc/Constants;->ROM_FOLDER:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/android/updater/customTypes/UpdateInfo;->getFileName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 350
    const-string v2, "update_info"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 352
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0, p1}, Lcom/android/updater/utils/StringUtils;->getModName(Landroid/content/Context;Lcom/android/updater/customTypes/UpdateInfo;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    invoke-virtual {p0, p4, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 353
    const v2, 0x7f060040

    const v3, 0x7f02001d

    move-object v0, p0

    move v4, p3

    invoke-static/range {v0 .. v6}, Lcom/android/updater/utils/SysUtils;->showNotification(Landroid/content/Context;Landroid/content/Intent;IIILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object v5, p2

    goto :goto_1
.end method

.method public static trimUpdatePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "path"

    .prologue
    .line 368
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/android/updater/misc/Constants;->SDCARD_FOLDER:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 369
    .local v0, sdcardPath:Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 370
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 372
    :cond_0
    return-object p0
.end method
