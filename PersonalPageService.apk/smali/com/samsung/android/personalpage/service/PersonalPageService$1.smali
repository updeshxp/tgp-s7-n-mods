.class Lcom/samsung/android/personalpage/service/PersonalPageService$1;
.super Landroid/content/BroadcastReceiver;
.source "PersonalPageService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/samsung/android/personalpage/service/PersonalPageService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;


# direct methods
.method constructor <init>(Lcom/samsung/android/personalpage/service/PersonalPageService;)V
    .locals 0

    iput-object p1, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9

    const/4 v4, 0x1

    const/4 v8, 0x0

    const/4 v7, 0x0

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v3, "PersonalPageService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "onReceive: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/samsung/android/personalpage/service/util/PersonalPageLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v3, "android.intent.action.LOCALE_CHANGED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-wrap6(Lcom/samsung/android/personalpage/service/PersonalPageService;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string/jumbo v3, "android.intent.action.USER_SWITCHED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string/jumbo v3, "android.intent.action.MANAGED_PROFILE_ADDED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    :cond_2
    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-wrap7(Lcom/samsung/android/personalpage/service/PersonalPageService;)V

    goto :goto_0

    :cond_3
    const-string/jumbo v3, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    iget-object v3, v3, Lcom/samsung/android/personalpage/service/PersonalPageService;->mPrivateModeDialog:Landroid/app/AlertDialog;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    iget-object v3, v3, Lcom/samsung/android/personalpage/service/PersonalPageService;->mPrivateModeDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_4

    :try_start_0
    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-get1(Lcom/samsung/android/personalpage/service/PersonalPageService;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string/jumbo v4, "personal_mode_enabled"

    invoke-static {v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x2

    if-ne v4, v3, :cond_4

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    iget-object v3, v3, Lcom/samsung/android/personalpage/service/PersonalPageService;->mPrivateModeDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->cancel()V
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_4
    :goto_1
    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-get2(Lcom/samsung/android/personalpage/service/PersonalPageService;)Lcom/samsung/android/privatemode/IPrivateModeManager$Stub;

    move-result-object v3

    check-cast v3, Lcom/samsung/android/personalpage/service/PrivateModeManagerService;

    iget-object v3, v3, Lcom/samsung/android/personalpage/service/PrivateModeManagerService;->mPrivateModeNormalDialog:Landroid/app/AlertDialog;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-get2(Lcom/samsung/android/personalpage/service/PersonalPageService;)Lcom/samsung/android/privatemode/IPrivateModeManager$Stub;

    move-result-object v3

    check-cast v3, Lcom/samsung/android/personalpage/service/PrivateModeManagerService;

    iget-object v3, v3, Lcom/samsung/android/personalpage/service/PrivateModeManagerService;->mPrivateModeNormalDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-get2(Lcom/samsung/android/personalpage/service/PersonalPageService;)Lcom/samsung/android/privatemode/IPrivateModeManager$Stub;

    move-result-object v3

    check-cast v3, Lcom/samsung/android/personalpage/service/PrivateModeManagerService;

    iget-object v3, v3, Lcom/samsung/android/personalpage/service/PrivateModeManagerService;->mPrivateModeNormalDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->cancel()V

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Landroid/provider/Settings$SettingNotFoundException;->printStackTrace()V

    goto :goto_1

    :cond_5
    const-string/jumbo v3, "com.samsung.intent.action.EMERGENCY_STATE_CHANGED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    const-string/jumbo v3, "reason"

    invoke-virtual {p2, v3, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    const-string/jumbo v3, "PersonalPageService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "EMERGENCY_STATE_CHANGED resaon:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/samsung/android/personalpage/service/util/PersonalPageLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-wrap7(Lcom/samsung/android/personalpage/service/PersonalPageService;)V

    goto/16 :goto_0

    :cond_6
    const-string/jumbo v3, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    const-string/jumbo v3, "android.intent.action.DREAMING_STARTED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_7
    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-virtual {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string/jumbo v5, "personal_mode_auto_disable_when_screen_off"

    invoke-static {v3, v5, v8}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    if-eqz v3, :cond_a

    const-string/jumbo v3, "PersonalPageService"

    const-string/jumbo v5, "ACTION_SCREEN_OFF going to turn off"

    invoke-static {v3, v5}, Lcom/samsung/android/personalpage/service/util/PersonalPageLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-virtual {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->cancelVerifyByUser()Z

    move-result v3

    if-nez v3, :cond_8

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-wrap7(Lcom/samsung/android/personalpage/service/PersonalPageService;)V

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3, v4}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-set1(Lcom/samsung/android/personalpage/service/PersonalPageService;Z)Z

    :cond_8
    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    iget-object v3, v3, Lcom/samsung/android/personalpage/service/PersonalPageService;->mPrivateModeDialog:Landroid/app/AlertDialog;

    if-eqz v3, :cond_9

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    iget-object v3, v3, Lcom/samsung/android/personalpage/service/PersonalPageService;->mPrivateModeDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_9

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    iget-object v3, v3, Lcom/samsung/android/personalpage/service/PersonalPageService;->mPrivateModeDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->cancel()V

    :cond_9
    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-get2(Lcom/samsung/android/personalpage/service/PersonalPageService;)Lcom/samsung/android/privatemode/IPrivateModeManager$Stub;

    move-result-object v3

    check-cast v3, Lcom/samsung/android/personalpage/service/PrivateModeManagerService;

    iget-object v3, v3, Lcom/samsung/android/personalpage/service/PrivateModeManagerService;->mPrivateModeNormalDialog:Landroid/app/AlertDialog;

    if-eqz v3, :cond_a

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-get2(Lcom/samsung/android/personalpage/service/PersonalPageService;)Lcom/samsung/android/privatemode/IPrivateModeManager$Stub;

    move-result-object v3

    check-cast v3, Lcom/samsung/android/personalpage/service/PrivateModeManagerService;

    iget-object v3, v3, Lcom/samsung/android/personalpage/service/PrivateModeManagerService;->mPrivateModeNormalDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_a

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-get2(Lcom/samsung/android/personalpage/service/PersonalPageService;)Lcom/samsung/android/privatemode/IPrivateModeManager$Stub;

    move-result-object v3

    check-cast v3, Lcom/samsung/android/personalpage/service/PrivateModeManagerService;

    iget-object v3, v3, Lcom/samsung/android/personalpage/service/PrivateModeManagerService;->mPrivateModeNormalDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->cancel()V

    :cond_a
    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-get0(Lcom/samsung/android/personalpage/service/PersonalPageService;)Lcom/samsung/android/personalpage/service/activity/PersonalPageServiceActivity;

    move-result-object v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-get0(Lcom/samsung/android/personalpage/service/PersonalPageService;)Lcom/samsung/android/personalpage/service/activity/PersonalPageServiceActivity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/samsung/android/personalpage/service/activity/PersonalPageServiceActivity;->isDestroyed()Z

    move-result v3

    if-nez v3, :cond_b

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-get0(Lcom/samsung/android/personalpage/service/PersonalPageService;)Lcom/samsung/android/personalpage/service/activity/PersonalPageServiceActivity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/samsung/android/personalpage/service/activity/PersonalPageServiceActivity;->isFinishing()Z

    move-result v3

    :goto_2
    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-get0(Lcom/samsung/android/personalpage/service/PersonalPageService;)Lcom/samsung/android/personalpage/service/activity/PersonalPageServiceActivity;

    move-result-object v3

    invoke-virtual {v3, v8}, Lcom/samsung/android/personalpage/service/activity/PersonalPageServiceActivity;->onWindowFocusChanged(Z)V

    iget-object v3, p0, Lcom/samsung/android/personalpage/service/PersonalPageService$1;->this$0:Lcom/samsung/android/personalpage/service/PersonalPageService;

    invoke-static {v3, v7}, Lcom/samsung/android/personalpage/service/PersonalPageService;->-set0(Lcom/samsung/android/personalpage/service/PersonalPageService;Lcom/samsung/android/personalpage/service/activity/PersonalPageServiceActivity;)Lcom/samsung/android/personalpage/service/activity/PersonalPageServiceActivity;

    goto/16 :goto_0

    :cond_b
    move v3, v4

    goto :goto_2
.end method
