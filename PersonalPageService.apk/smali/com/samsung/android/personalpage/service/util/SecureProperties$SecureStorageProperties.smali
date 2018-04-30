.class Lcom/samsung/android/personalpage/service/util/SecureProperties$SecureStorageProperties;
.super Lcom/samsung/android/personalpage/service/util/SecureProperties$PropertiesImpl;
.source "SecureProperties.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/samsung/android/personalpage/service/util/SecureProperties;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SecureStorageProperties"
.end annotation


# static fields
.field private static final IMPL_TAG:Ljava/lang/String; = "SecureStorageProperties"

.field private static sInstance:Lcom/samsung/android/personalpage/service/util/SecureProperties$SecureStorageProperties;


# instance fields
.field private final secureStorage:Lcom/sec/android/securestorage/SecureStorage;


# direct methods
.method private constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/samsung/android/personalpage/service/util/SecureProperties$PropertiesImpl;-><init>(Lcom/samsung/android/personalpage/service/util/SecureProperties$PropertiesImpl;)V

    invoke-static {}, Lcom/sec/android/securestorage/SecureStorage;->isSupported()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v0, Lcom/sec/android/securestorage/SecureStorage;

    invoke-direct {v0}, Lcom/sec/android/securestorage/SecureStorage;-><init>()V

    :cond_0
    iput-object v0, p0, Lcom/samsung/android/personalpage/service/util/SecureProperties$SecureStorageProperties;->secureStorage:Lcom/sec/android/securestorage/SecureStorage;

    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/samsung/android/personalpage/service/util/SecureProperties$PropertiesImpl;
    .locals 7

    const-class v4, Lcom/samsung/android/personalpage/service/util/SecureProperties$SecureStorageProperties;

    monitor-enter v4

    :try_start_0
    sget-object v3, Lcom/samsung/android/personalpage/service/util/SecureProperties$SecureStorageProperties;->sInstance:Lcom/samsung/android/personalpage/service/util/SecureProperties$SecureStorageProperties;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v3, :cond_0

    :try_start_1
    new-instance v3, Lcom/samsung/android/personalpage/service/util/SecureProperties$SecureStorageProperties;

    invoke-direct {v3}, Lcom/samsung/android/personalpage/service/util/SecureProperties$SecureStorageProperties;-><init>()V

    sput-object v3, Lcom/samsung/android/personalpage/service/util/SecureProperties$SecureStorageProperties;->sInstance:Lcom/samsung/android/personalpage/service/util/SecureProperties$SecureStorageProperties;
    :try_end_1
    .catch Ljava/lang/ExceptionInInitializerError; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_0
    :goto_0
    :try_start_2
    sget-object v3, Lcom/samsung/android/personalpage/service/util/SecureProperties$SecureStorageProperties;->sInstance:Lcom/samsung/android/personalpage/service/util/SecureProperties$SecureStorageProperties;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v4

    return-object v3

    :catch_0
    move-exception v0

    :try_start_3
    const-string/jumbo v3, "SecureStorageProperties"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Failed to create SecureStorageProperties: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/samsung/android/personalpage/service/util/PersonalPageLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3

    :catch_1
    move-exception v2

    :try_start_4
    const-string/jumbo v3, "SecureStorageProperties"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Failed to create SecureStorageProperties: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/samsung/android/personalpage/service/util/PersonalPageLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catch_2
    move-exception v1

    const-string/jumbo v3, "SecureStorageProperties"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Failed to create SecureStorageProperties: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/samsung/android/personalpage/service/util/PersonalPageLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0
.end method


# virtual methods
.method public getProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    const/4 v4, 0x0

    iget-object v1, p0, Lcom/samsung/android/personalpage/service/util/SecureProperties$SecureStorageProperties;->secureStorage:Lcom/sec/android/securestorage/SecureStorage;

    if-eqz v1, :cond_0

    :try_start_0
    iget-object v1, p0, Lcom/samsung/android/personalpage/service/util/SecureProperties$SecureStorageProperties;->secureStorage:Lcom/sec/android/securestorage/SecureStorage;

    invoke-virtual {v1, p1}, Lcom/sec/android/securestorage/SecureStorage;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lcom/sec/android/securestorage/SecureStorage$SecureStorageException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    const-string/jumbo v1, "SecureStorageProperties"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "getProperty: failed to getString for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/samsung/android/personalpage/service/util/PersonalPageLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/sec/android/securestorage/SecureStorage$SecureStorageException;->printStackTrace()V

    :cond_0
    return-object v4
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4

    iget-object v1, p0, Lcom/samsung/android/personalpage/service/util/SecureProperties$SecureStorageProperties;->secureStorage:Lcom/sec/android/securestorage/SecureStorage;

    if-eqz v1, :cond_0

    :try_start_0
    const-string/jumbo v1, "SecureStorageProperties"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setProperty: key="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", value="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/samsung/android/personalpage/service/util/PersonalPageLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/samsung/android/personalpage/service/util/SecureProperties$SecureStorageProperties;->secureStorage:Lcom/sec/android/securestorage/SecureStorage;

    invoke-virtual {v1, p1, p2}, Lcom/sec/android/securestorage/SecureStorage;->put(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_0
    .catch Lcom/sec/android/securestorage/SecureStorage$SecureStorageException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    :catch_0
    move-exception v0

    const-string/jumbo v1, "SecureStorageProperties"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setProperty: failed to setString for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/samsung/android/personalpage/service/util/PersonalPageLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/sec/android/securestorage/SecureStorage$SecureStorageException;->printStackTrace()V

    :cond_0
    const/4 v1, 0x0

    return v1
.end method
