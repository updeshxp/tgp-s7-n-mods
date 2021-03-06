.class Lcom/android/server/wm/DragState;
.super Ljava/lang/Object;
.source "DragState.java"


# static fields
.field private static final ANIMATION_DURATION_MS:J = 0x1f4L

.field private static final DRAG_FLAGS_URI_ACCESS:I = 0x3

.field private static final DRAG_FLAGS_URI_PERMISSIONS:I = 0xc3


# instance fields
.field private mAnimation:Landroid/view/animation/Animation;

.field mClientChannel:Landroid/view/InputChannel;

.field mCrossProfileCopyAllowed:Z

.field private final mCubicEaseOutInterpolator:Landroid/view/animation/Interpolator;

.field mCurrentX:F

.field mCurrentY:F

.field mData:Landroid/content/ClipData;

.field mDataDescription:Landroid/content/ClipDescription;

.field mDisplayContent:Lcom/android/server/wm/DisplayContent;

.field mDragApplicationHandle:Lcom/android/server/input/InputApplicationHandle;

.field mDragInProgress:Z

.field mDragResult:Z

.field mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

.field mFlags:I

.field mInputEventReceiver:Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;

.field mLocalWin:Landroid/os/IBinder;

.field mNotifiedWindows:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/wm/WindowState;",
            ">;"
        }
    .end annotation
.end field

.field mOriginalAlpha:F

.field mOriginalX:F

.field mOriginalY:F

.field mPid:I

.field mServerChannel:Landroid/view/InputChannel;

.field final mService:Lcom/android/server/wm/WindowManagerService;

.field mSourceUserId:I

.field mSourceWindow:Lcom/android/server/wm/WindowState;

.field mSpec:Landroid/view/MagnificationSpec;

.field mSurfaceControl:Landroid/view/SurfaceControl;

.field mTargetWindow:Lcom/android/server/wm/WindowState;

.field mThumbOffsetX:F

.field mThumbOffsetY:F

.field mTmpMatrix:Landroid/graphics/Matrix;

.field mToken:Landroid/os/IBinder;

.field mTouchSource:I

.field final mTransformation:Landroid/view/animation/Transformation;

.field mUid:I


# direct methods
.method constructor <init>(Lcom/android/server/wm/WindowManagerService;Landroid/os/IBinder;Landroid/view/SurfaceControl;ILandroid/os/IBinder;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/view/animation/Transformation;

    invoke-direct {v0}, Landroid/view/animation/Transformation;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/DragState;->mTransformation:Landroid/view/animation/Transformation;

    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v1, 0x3fc00000    # 1.5f

    invoke-direct {v0, v1}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    iput-object v0, p0, Lcom/android/server/wm/DragState;->mCubicEaseOutInterpolator:Landroid/view/animation/Interpolator;

    iput-object p1, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    iput-object p2, p0, Lcom/android/server/wm/DragState;->mToken:Landroid/os/IBinder;

    iput-object p3, p0, Lcom/android/server/wm/DragState;->mSurfaceControl:Landroid/view/SurfaceControl;

    iput p4, p0, Lcom/android/server/wm/DragState;->mFlags:I

    iput-object p5, p0, Lcom/android/server/wm/DragState;->mLocalWin:Landroid/os/IBinder;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/DragState;->mNotifiedWindows:Ljava/util/ArrayList;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/DragState;->mTmpMatrix:Landroid/graphics/Matrix;

    return-void
.end method

.method private broadcastDragEndedLw()V
    .locals 13

    const/4 v3, 0x0

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v10

    sget-boolean v0, Lcom/android/server/wm/WindowManagerDebugConfig;->DEBUG_DRAG:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "WindowManager"

    const-string/jumbo v4, "broadcasting DRAG_ENDED"

    invoke-static {v0, v4}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Lcom/android/server/wm/DragState;->mNotifiedWindows:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_1
    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/android/server/wm/WindowState;

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-boolean v0, p0, Lcom/android/server/wm/DragState;->mDragResult:Z

    if-nez v0, :cond_2

    iget-object v0, v11, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    iget v0, v0, Lcom/android/server/wm/Session;->mPid:I

    iget v4, p0, Lcom/android/server/wm/DragState;->mPid:I

    if-ne v0, v4, :cond_2

    iget v1, p0, Lcom/android/server/wm/DragState;->mCurrentX:F

    iget v2, p0, Lcom/android/server/wm/DragState;->mCurrentY:F

    :cond_2
    iget-boolean v7, p0, Lcom/android/server/wm/DragState;->mDragResult:Z

    const/4 v0, 0x4

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-static/range {v0 .. v7}, Landroid/view/DragEvent;->obtain(IFFLjava/lang/Object;Landroid/content/ClipDescription;Landroid/content/ClipData;Lcom/android/internal/view/IDragAndDropPermissions;Z)Landroid/view/DragEvent;

    move-result-object v9

    :try_start_0
    iget-object v0, v11, Lcom/android/server/wm/WindowState;->mClient:Landroid/view/IWindow;

    invoke-interface {v0, v9}, Landroid/view/IWindow;->dispatchDragEvent(Landroid/view/DragEvent;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    iget-object v0, v11, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    iget v0, v0, Lcom/android/server/wm/Session;->mPid:I

    if-eq v10, v0, :cond_1

    invoke-virtual {v9}, Landroid/view/DragEvent;->recycle()V

    goto :goto_0

    :catch_0
    move-exception v8

    const-string/jumbo v0, "WindowManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Unable to drag-end window "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/android/server/wm/DragState;->mNotifiedWindows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/wm/DragState;->mDragInProgress:Z

    return-void
.end method

.method private cleanUpDragLw()V
    .locals 4

    invoke-direct {p0}, Lcom/android/server/wm/DragState;->broadcastDragEndedLw()V

    const/16 v0, 0x2002

    invoke-direct {p0, v0}, Lcom/android/server/wm/DragState;->isFromSource(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v1, p0, Lcom/android/server/wm/DragState;->mDisplayContent:Lcom/android/server/wm/DisplayContent;

    iget v2, p0, Lcom/android/server/wm/DragState;->mCurrentX:F

    iget v3, p0, Lcom/android/server/wm/DragState;->mCurrentY:F

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/server/wm/WindowManagerService;->restorePointerIconLocked(Lcom/android/server/wm/DisplayContent;FF)V

    :cond_0
    invoke-virtual {p0}, Lcom/android/server/wm/DragState;->unregister()V

    invoke-virtual {p0}, Lcom/android/server/wm/DragState;->reset()V

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/server/wm/WindowManagerService;->mDragState:Lcom/android/server/wm/DragState;

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mInputMonitor:Lcom/android/server/wm/InputMonitor;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/server/wm/InputMonitor;->updateInputWindowsLw(Z)V

    return-void
.end method

.method private createCancelAnimationLocked()Landroid/view/animation/Animation;
    .locals 9

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    const/4 v8, 0x0

    new-instance v7, Landroid/view/animation/AnimationSet;

    invoke-direct {v7, v8}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    new-instance v0, Landroid/view/animation/ScaleAnimation;

    iget v5, p0, Lcom/android/server/wm/DragState;->mThumbOffsetX:F

    iget v6, p0, Lcom/android/server/wm/DragState;->mThumbOffsetY:F

    move v3, v1

    move v4, v2

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    invoke-virtual {v7, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    new-instance v0, Landroid/view/animation/AlphaAnimation;

    iget v1, p0, Lcom/android/server/wm/DragState;->mOriginalAlpha:F

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    invoke-virtual {v7, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    const-wide/16 v0, 0x1f4

    invoke-virtual {v7, v0, v1}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mCubicEaseOutInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v7, v0}, Landroid/view/animation/AnimationSet;->setInterpolator(Landroid/view/animation/Interpolator;)V

    invoke-virtual {v7, v8, v8, v8, v8}, Landroid/view/animation/AnimationSet;->initialize(IIII)V

    invoke-virtual {v7}, Landroid/view/animation/AnimationSet;->start()V

    return-object v7
.end method

.method private createReturnAnimationLocked()Landroid/view/animation/Animation;
    .locals 7

    const/4 v6, 0x0

    const/4 v5, 0x0

    new-instance v0, Landroid/view/animation/AnimationSet;

    invoke-direct {v0, v5}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    new-instance v1, Landroid/view/animation/TranslateAnimation;

    iget v2, p0, Lcom/android/server/wm/DragState;->mOriginalX:F

    iget v3, p0, Lcom/android/server/wm/DragState;->mCurrentX:F

    sub-float/2addr v2, v3

    iget v3, p0, Lcom/android/server/wm/DragState;->mOriginalY:F

    iget v4, p0, Lcom/android/server/wm/DragState;->mCurrentY:F

    sub-float/2addr v3, v4

    invoke-direct {v1, v6, v2, v6, v3}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    new-instance v1, Landroid/view/animation/AlphaAnimation;

    iget v2, p0, Lcom/android/server/wm/DragState;->mOriginalAlpha:F

    iget v3, p0, Lcom/android/server/wm/DragState;->mOriginalAlpha:F

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    invoke-direct {v1, v2, v3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    iget-object v1, p0, Lcom/android/server/wm/DragState;->mCubicEaseOutInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->setInterpolator(Landroid/view/animation/Interpolator;)V

    invoke-virtual {v0, v5, v5, v5, v5}, Landroid/view/animation/AnimationSet;->initialize(IIII)V

    invoke-virtual {v0}, Landroid/view/animation/AnimationSet;->start()V

    return-object v0
.end method

.method private isFromSource(I)Z
    .locals 1

    iget v0, p0, Lcom/android/server/wm/DragState;->mTouchSource:I

    and-int/2addr v0, p1

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isValidDropTarget(Lcom/android/server/wm/WindowState;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p1, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Lcom/android/server/wm/WindowState;->isPotentialDragTarget()Z

    move-result v2

    if-nez v2, :cond_1

    return v1

    :cond_1
    iget v2, p0, Lcom/android/server/wm/DragState;->mFlags:I

    and-int/lit16 v2, v2, 0x100

    if-eqz v2, :cond_4

    invoke-direct {p0, p1}, Lcom/android/server/wm/DragState;->targetWindowSupportsGlobalDrag(Lcom/android/server/wm/WindowState;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_2
    iget-boolean v2, p0, Lcom/android/server/wm/DragState;->mCrossProfileCopyAllowed:Z

    if-nez v2, :cond_3

    iget v2, p0, Lcom/android/server/wm/DragState;->mSourceUserId:I

    invoke-virtual {p1}, Lcom/android/server/wm/WindowState;->getOwningUid()I

    move-result v3

    invoke-static {v3}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v3

    if-ne v2, v3, :cond_5

    :cond_3
    :goto_0
    return v0

    :cond_4
    iget-object v2, p0, Lcom/android/server/wm/DragState;->mLocalWin:Landroid/os/IBinder;

    iget-object v3, p1, Lcom/android/server/wm/WindowState;->mClient:Landroid/view/IWindow;

    invoke-interface {v3}, Landroid/view/IWindow;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    if-eq v2, v3, :cond_2

    return v1

    :cond_5
    move v0, v1

    goto :goto_0
.end method

.method private isWindowNotified(Lcom/android/server/wm/WindowState;)Z
    .locals 3

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mNotifiedWindows:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/wm/WindowState;

    if-ne v0, p1, :cond_0

    const/4 v2, 0x1

    return v2

    :cond_1
    const/4 v2, 0x0

    return v2
.end method

.method private static obtainDragEvent(Lcom/android/server/wm/WindowState;IFFLjava/lang/Object;Landroid/content/ClipDescription;Landroid/content/ClipData;Lcom/android/internal/view/IDragAndDropPermissions;Z)Landroid/view/DragEvent;
    .locals 8

    invoke-virtual {p0, p2}, Lcom/android/server/wm/WindowState;->translateToWindowX(F)F

    move-result v1

    invoke-virtual {p0, p3}, Lcom/android/server/wm/WindowState;->translateToWindowY(F)F

    move-result v2

    move v0, p1

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    move-object v6, p7

    move/from16 v7, p8

    invoke-static/range {v0 .. v7}, Landroid/view/DragEvent;->obtain(IFFLjava/lang/Object;Landroid/content/ClipDescription;Landroid/content/ClipData;Lcom/android/internal/view/IDragAndDropPermissions;Z)Landroid/view/DragEvent;

    move-result-object v0

    return-object v0
.end method

.method private sendDragStartedLw(Lcom/android/server/wm/WindowState;FFLandroid/content/ClipDescription;)V
    .locals 11

    const/4 v4, 0x0

    iget-boolean v0, p0, Lcom/android/server/wm/DragState;->mDragInProgress:Z

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/android/server/wm/DragState;->isValidDropTarget(Lcom/android/server/wm/WindowState;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    const/4 v8, 0x0

    move-object v0, p1

    move v2, p2

    move v3, p3

    move-object v5, p4

    move-object v6, v4

    move-object v7, v4

    invoke-static/range {v0 .. v8}, Lcom/android/server/wm/DragState;->obtainDragEvent(Lcom/android/server/wm/WindowState;IFFLjava/lang/Object;Landroid/content/ClipDescription;Landroid/content/ClipData;Lcom/android/internal/view/IDragAndDropPermissions;Z)Landroid/view/DragEvent;

    move-result-object v10

    :try_start_0
    iget-object v0, p1, Lcom/android/server/wm/WindowState;->mClient:Landroid/view/IWindow;

    invoke-interface {v0, v10}, Landroid/view/IWindow;->dispatchDragEvent(Landroid/view/DragEvent;)V

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mNotifiedWindows:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    iget-object v1, p1, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    iget v1, v1, Lcom/android/server/wm/Session;->mPid:I

    if-eq v0, v1, :cond_0

    invoke-virtual {v10}, Landroid/view/DragEvent;->recycle()V

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v9

    :try_start_1
    const-string/jumbo v0, "WindowManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unable to drag-start window "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    iget-object v1, p1, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    iget v1, v1, Lcom/android/server/wm/Session;->mPid:I

    if-eq v0, v1, :cond_0

    invoke-virtual {v10}, Landroid/view/DragEvent;->recycle()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    iget-object v2, p1, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    iget v2, v2, Lcom/android/server/wm/Session;->mPid:I

    if-eq v1, v2, :cond_1

    invoke-virtual {v10}, Landroid/view/DragEvent;->recycle()V

    :cond_1
    throw v0
.end method

.method private targetWindowSupportsGlobalDrag(Lcom/android/server/wm/WindowState;)Z
    .locals 3

    const/4 v0, 0x1

    iget-object v1, p1, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget v1, v1, Lcom/android/server/wm/AppWindowToken;->targetSdk:I

    const/16 v2, 0x18

    if-lt v1, v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method broadcastDragStartedLw(FF)V
    .locals 9

    const/4 v5, 0x0

    const/4 v7, 0x1

    const/4 v6, 0x0

    iput p1, p0, Lcom/android/server/wm/DragState;->mCurrentX:F

    iput p1, p0, Lcom/android/server/wm/DragState;->mOriginalX:F

    iput p2, p0, Lcom/android/server/wm/DragState;->mCurrentY:F

    iput p2, p0, Lcom/android/server/wm/DragState;->mOriginalY:F

    iget-object v8, p0, Lcom/android/server/wm/DragState;->mData:Landroid/content/ClipData;

    if-eqz v8, :cond_0

    iget-object v5, p0, Lcom/android/server/wm/DragState;->mData:Landroid/content/ClipData;

    invoke-virtual {v5}, Landroid/content/ClipData;->getDescription()Landroid/content/ClipDescription;

    move-result-object v5

    :cond_0
    iput-object v5, p0, Lcom/android/server/wm/DragState;->mDataDescription:Landroid/content/ClipDescription;

    iget-object v5, p0, Lcom/android/server/wm/DragState;->mNotifiedWindows:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    iput-boolean v7, p0, Lcom/android/server/wm/DragState;->mDragInProgress:Z

    iget v5, p0, Lcom/android/server/wm/DragState;->mUid:I

    invoke-static {v5}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v5

    iput v5, p0, Lcom/android/server/wm/DragState;->mSourceUserId:I

    const-string/jumbo v5, "user"

    invoke-static {v5}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    check-cast v3, Landroid/os/IUserManager;

    :try_start_0
    iget v5, p0, Lcom/android/server/wm/DragState;->mSourceUserId:I

    invoke-interface {v3, v5}, Landroid/os/IUserManager;->getUserRestrictions(I)Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v8, "no_cross_profile_copy_paste"

    invoke-virtual {v5, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    move v5, v6

    :goto_0
    iput-boolean v5, p0, Lcom/android/server/wm/DragState;->mCrossProfileCopyAllowed:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    sget-boolean v5, Lcom/android/server/wm/WindowManagerDebugConfig;->DEBUG_DRAG:Z

    if-eqz v5, :cond_1

    const-string/jumbo v5, "WindowManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "broadcasting DRAG_STARTED at ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-object v5, p0, Lcom/android/server/wm/DragState;->mDisplayContent:Lcom/android/server/wm/DisplayContent;

    invoke-virtual {v5}, Lcom/android/server/wm/DisplayContent;->getWindowList()Lcom/android/server/wm/WindowList;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/server/wm/WindowList;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_2
    if-ge v2, v0, :cond_3

    invoke-virtual {v4, v2}, Lcom/android/server/wm/WindowList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/wm/WindowState;

    iget-object v6, p0, Lcom/android/server/wm/DragState;->mDataDescription:Landroid/content/ClipDescription;

    invoke-direct {p0, v5, p1, p2, v6}, Lcom/android/server/wm/DragState;->sendDragStartedLw(Lcom/android/server/wm/WindowState;FFLandroid/content/ClipDescription;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_2
    move v5, v7

    goto :goto_0

    :catch_0
    move-exception v1

    const-string/jumbo v5, "WindowManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Remote Exception calling UserManager: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v6, p0, Lcom/android/server/wm/DragState;->mCrossProfileCopyAllowed:Z

    goto :goto_1

    :cond_3
    return-void
.end method

.method cancelDragLw()V
    .locals 1

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/android/server/wm/DragState;->createCancelAnimationLocked()Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/wm/DragState;->mAnimation:Landroid/view/animation/Animation;

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v0}, Lcom/android/server/wm/WindowManagerService;->scheduleAnimationLocked()V

    return-void
.end method

.method endDragLw()V
    .locals 2

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/android/server/wm/DragState;->mDragResult:Z

    if-nez v0, :cond_1

    iget v0, p0, Lcom/android/server/wm/DragState;->mFlags:I

    const/high16 v1, 0x100000

    and-int/2addr v0, v1

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/server/wm/DragState;->createReturnAnimationLocked()Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/wm/DragState;->mAnimation:Landroid/view/animation/Animation;

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v0}, Lcom/android/server/wm/WindowManagerService;->scheduleAnimationLocked()V

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/android/server/wm/DragState;->cleanUpDragLw()V

    return-void
.end method

.method getDragLayerLw()I
    .locals 2

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    const/16 v1, 0x7e0

    invoke-interface {v0, v1}, Landroid/view/WindowManagerPolicy;->windowTypeToLayerLw(I)I

    move-result v0

    mul-int/lit16 v0, v0, 0x2710

    add-int/lit16 v0, v0, 0x3e8

    return v0
.end method

.method notifyDropLw(FF)Z
    .locals 24

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/DragState;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v3, :cond_0

    const/4 v3, 0x0

    return v3

    :cond_0
    move/from16 v0, p1

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/DragState;->mCurrentX:F

    move/from16 v0, p2

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/DragState;->mCurrentY:F

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/DragState;->mDisplayContent:Lcom/android/server/wm/DisplayContent;

    move/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v3, v0, v1}, Lcom/android/server/wm/DisplayContent;->getTouchableWinAtPointLocked(FF)Lcom/android/server/wm/WindowState;

    move-result-object v9

    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/android/server/wm/DragState;->isWindowNotified(Lcom/android/server/wm/WindowState;)Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/android/server/wm/DragState;->mDragResult:Z

    const/4 v3, 0x1

    return v3

    :cond_1
    sget-boolean v3, Lcom/android/server/wm/WindowManagerDebugConfig;->DEBUG_DRAG:Z

    if-eqz v3, :cond_2

    const-string/jumbo v3, "WindowManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "sending DROP to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    invoke-virtual {v9}, Lcom/android/server/wm/WindowState;->getOwningUid()I

    move-result v3

    invoke-static {v3}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v8

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/wm/DragState;->mFlags:I

    and-int/lit16 v3, v3, 0x100

    if-eqz v3, :cond_3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/wm/DragState;->mFlags:I

    and-int/lit8 v3, v3, 0x3

    if-eqz v3, :cond_3

    new-instance v2, Lcom/android/server/wm/DragAndDropPermissionsHandler;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/DragState;->mData:Landroid/content/ClipData;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/server/wm/DragState;->mUid:I

    invoke-virtual {v9}, Lcom/android/server/wm/WindowState;->getOwningPackage()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/server/wm/DragState;->mFlags:I

    and-int/lit16 v6, v6, 0xc3

    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/server/wm/DragState;->mSourceUserId:I

    invoke-direct/range {v2 .. v8}, Lcom/android/server/wm/DragAndDropPermissionsHandler;-><init>(Landroid/content/ClipData;ILjava/lang/String;III)V

    :cond_3
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/wm/DragState;->mSourceUserId:I

    if-eq v3, v8, :cond_4

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/DragState;->mData:Landroid/content/ClipData;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/server/wm/DragState;->mSourceUserId:I

    invoke-virtual {v3, v4}, Landroid/content/ClipData;->fixUris(I)V

    :cond_4
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v21

    iget-object v3, v9, Lcom/android/server/wm/WindowState;->mClient:Landroid/view/IWindow;

    invoke-interface {v3}, Landroid/view/IWindow;->asBinder()Landroid/os/IBinder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/wm/DragState;->mData:Landroid/content/ClipData;

    const/4 v10, 0x3

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v17, 0x0

    move/from16 v11, p1

    move/from16 v12, p2

    move-object/from16 v16, v2

    invoke-static/range {v9 .. v17}, Lcom/android/server/wm/DragState;->obtainDragEvent(Lcom/android/server/wm/WindowState;IFFLjava/lang/Object;Landroid/content/ClipDescription;Landroid/content/ClipData;Lcom/android/internal/view/IDragAndDropPermissions;Z)Landroid/view/DragEvent;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/DragState;->mSourceWindow:Lcom/android/server/wm/WindowState;

    if-eqz v3, :cond_6

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/DragState;->mSourceWindow:Lcom/android/server/wm/WindowState;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowState;->getOwningUid()I

    move-result v3

    invoke-static {v3}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v22

    const/16 v3, 0x64

    move/from16 v0, v22

    if-lt v0, v3, :cond_6

    const/16 v3, 0xc8

    move/from16 v0, v22

    if-gt v0, v3, :cond_6

    const/16 v3, 0x64

    if-lt v8, v3, :cond_5

    const/16 v3, 0xc8

    if-le v8, v3, :cond_6

    :cond_5
    const-string/jumbo v3, "WindowManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "ACTION_DROP sourceUserId-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " and targetUserId-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string/jumbo v3, "WindowManager"

    const-string/jumbo v4, "Blocking ACTION_DROP in target window. It\'s knox protection..."

    invoke-static {v3, v4}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v3, 0x1

    return v3

    :cond_6
    :try_start_0
    iget-object v3, v9, Lcom/android/server/wm/WindowState;->mClient:Landroid/view/IWindow;

    move-object/from16 v0, v19

    invoke-interface {v3, v0}, Landroid/view/IWindow;->dispatchDragEvent(Landroid/view/DragEvent;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    const/16 v4, 0x15

    move-object/from16 v0, v23

    invoke-virtual {v3, v4, v0}, Lcom/android/server/wm/WindowManagerService$H;->removeMessages(ILjava/lang/Object;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    const/16 v4, 0x15

    move-object/from16 v0, v23

    invoke-virtual {v3, v4, v0}, Lcom/android/server/wm/WindowManagerService$H;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    const-wide/16 v4, 0x1388

    move-object/from16 v0, v20

    invoke-virtual {v3, v0, v4, v5}, Lcom/android/server/wm/WindowManagerService$H;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v3, v9, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    iget v3, v3, Lcom/android/server/wm/Session;->mPid:I

    move/from16 v0, v21

    if-eq v0, v3, :cond_7

    invoke-virtual/range {v19 .. v19}, Landroid/view/DragEvent;->recycle()V

    :cond_7
    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/wm/DragState;->mToken:Landroid/os/IBinder;

    const/4 v3, 0x0

    return v3

    :catch_0
    move-exception v18

    :try_start_1
    const-string/jumbo v3, "WindowManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "can\'t send drop notification to win "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v3, 0x1

    iget-object v4, v9, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    iget v4, v4, Lcom/android/server/wm/Session;->mPid:I

    move/from16 v0, v21

    if-eq v0, v4, :cond_8

    invoke-virtual/range {v19 .. v19}, Landroid/view/DragEvent;->recycle()V

    :cond_8
    return v3

    :catchall_0
    move-exception v3

    iget-object v4, v9, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    iget v4, v4, Lcom/android/server/wm/Session;->mPid:I

    move/from16 v0, v21

    if-eq v0, v4, :cond_9

    invoke-virtual/range {v19 .. v19}, Landroid/view/DragEvent;->recycle()V

    :cond_9
    throw v3
.end method

.method notifyLocationLw(FF)V
    .locals 13

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mDisplayContent:Lcom/android/server/wm/DisplayContent;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/wm/DisplayContent;->getTouchableWinAtPointLocked(FF)Lcom/android/server/wm/WindowState;

    move-result-object v12

    if-eqz v12, :cond_0

    invoke-direct {p0, v12}, Lcom/android/server/wm/DragState;->isWindowNotified(Lcom/android/server/wm/WindowState;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_0
    :goto_0
    :try_start_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v11

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mTargetWindow:Lcom/android/server/wm/WindowState;

    if-eq v12, v0, :cond_2

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mTargetWindow:Lcom/android/server/wm/WindowState;

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/android/server/wm/WindowManagerDebugConfig;->DEBUG_DRAG:Z

    if-eqz v0, :cond_1

    const-string/jumbo v0, "WindowManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "sending DRAG_EXITED to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mTargetWindow:Lcom/android/server/wm/WindowState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-object v0, p0, Lcom/android/server/wm/DragState;->mTargetWindow:Lcom/android/server/wm/WindowState;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v1, 0x6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v0 .. v8}, Lcom/android/server/wm/DragState;->obtainDragEvent(Lcom/android/server/wm/WindowState;IFFLjava/lang/Object;Landroid/content/ClipDescription;Landroid/content/ClipData;Lcom/android/internal/view/IDragAndDropPermissions;Z)Landroid/view/DragEvent;

    move-result-object v10

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mTargetWindow:Lcom/android/server/wm/WindowState;

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mClient:Landroid/view/IWindow;

    invoke-interface {v0, v10}, Landroid/view/IWindow;->dispatchDragEvent(Landroid/view/DragEvent;)V

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mTargetWindow:Lcom/android/server/wm/WindowState;

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    iget v0, v0, Lcom/android/server/wm/Session;->mPid:I

    if-eq v11, v0, :cond_2

    invoke-virtual {v10}, Landroid/view/DragEvent;->recycle()V

    :cond_2
    if-eqz v12, :cond_3

    const/4 v1, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v0, v12

    move v2, p1

    move v3, p2

    invoke-static/range {v0 .. v8}, Lcom/android/server/wm/DragState;->obtainDragEvent(Lcom/android/server/wm/WindowState;IFFLjava/lang/Object;Landroid/content/ClipDescription;Landroid/content/ClipData;Lcom/android/internal/view/IDragAndDropPermissions;Z)Landroid/view/DragEvent;

    move-result-object v10

    iget-object v0, v12, Lcom/android/server/wm/WindowState;->mClient:Landroid/view/IWindow;

    invoke-interface {v0, v10}, Landroid/view/IWindow;->dispatchDragEvent(Landroid/view/DragEvent;)V

    iget-object v0, v12, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    iget v0, v0, Lcom/android/server/wm/Session;->mPid:I

    if-eq v11, v0, :cond_3

    invoke-virtual {v10}, Landroid/view/DragEvent;->recycle()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_3
    :goto_1
    iput-object v12, p0, Lcom/android/server/wm/DragState;->mTargetWindow:Lcom/android/server/wm/WindowState;

    return-void

    :cond_4
    const/4 v12, 0x0

    goto :goto_0

    :catch_0
    move-exception v9

    const-string/jumbo v0, "WindowManager"

    const-string/jumbo v1, "can\'t send drag notification to windows"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method notifyMoveLw(FF)V
    .locals 5

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v2, :cond_0

    return-void

    :cond_0
    iput p1, p0, Lcom/android/server/wm/DragState;->mCurrentX:F

    iput p2, p0, Lcom/android/server/wm/DragState;->mCurrentY:F

    sget-boolean v2, Lcom/android/server/wm/WindowManagerDebugConfig;->SHOW_LIGHT_TRANSACTIONS:Z

    if-eqz v2, :cond_1

    const-string/jumbo v2, "WindowManager"

    const-string/jumbo v3, ">>> OPEN TRANSACTION notifyMoveLw"

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    invoke-static {}, Landroid/view/SurfaceControl;->openTransaction()V

    :try_start_0
    iget-object v2, p0, Lcom/android/server/wm/DragState;->mSpec:Landroid/view/MagnificationSpec;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mSpec:Landroid/view/MagnificationSpec;

    iget v2, v2, Landroid/view/MagnificationSpec;->scale:F

    const/high16 v3, 0x3f800000    # 1.0f

    cmpg-float v2, v2, v3

    if-gez v2, :cond_4

    iget v2, p0, Lcom/android/server/wm/DragState;->mThumbOffsetX:F

    sub-float v2, p1, v2

    iget-object v3, p0, Lcom/android/server/wm/DragState;->mSpec:Landroid/view/MagnificationSpec;

    iget v3, v3, Landroid/view/MagnificationSpec;->scale:F

    mul-float/2addr v2, v3

    iget-object v3, p0, Lcom/android/server/wm/DragState;->mSpec:Landroid/view/MagnificationSpec;

    iget v3, v3, Landroid/view/MagnificationSpec;->offsetX:F

    add-float/2addr v2, v3

    float-to-int v0, v2

    iget v2, p0, Lcom/android/server/wm/DragState;->mThumbOffsetY:F

    sub-float v2, p2, v2

    iget-object v3, p0, Lcom/android/server/wm/DragState;->mSpec:Landroid/view/MagnificationSpec;

    iget v3, v3, Landroid/view/MagnificationSpec;->scale:F

    mul-float/2addr v2, v3

    iget-object v3, p0, Lcom/android/server/wm/DragState;->mSpec:Landroid/view/MagnificationSpec;

    iget v3, v3, Landroid/view/MagnificationSpec;->offsetY:F

    add-float/2addr v2, v3

    float-to-int v1, v2

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mSurfaceControl:Landroid/view/SurfaceControl;

    int-to-float v3, v0

    int-to-float v4, v1

    invoke-virtual {v2, v3, v4}, Landroid/view/SurfaceControl;->setPosition(FF)V

    :goto_0
    sget-boolean v2, Lcom/android/server/wm/WindowManagerDebugConfig;->SHOW_TRANSACTIONS:Z

    if-eqz v2, :cond_2

    const-string/jumbo v2, "WindowManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "  DRAG "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mSurfaceControl:Landroid/view/SurfaceControl;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ": pos=("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/server/wm/DragState;->mThumbOffsetX:F

    sub-float v4, p1, v4

    float-to-int v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/server/wm/DragState;->mThumbOffsetY:F

    sub-float v4, p2, v4

    float-to-int v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    invoke-static {}, Landroid/view/SurfaceControl;->closeTransaction()V

    sget-boolean v2, Lcom/android/server/wm/WindowManagerDebugConfig;->SHOW_LIGHT_TRANSACTIONS:Z

    if-eqz v2, :cond_3

    const-string/jumbo v2, "WindowManager"

    const-string/jumbo v3, "<<< CLOSE TRANSACTION notifyMoveLw"

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    invoke-virtual {p0, p1, p2}, Lcom/android/server/wm/DragState;->notifyLocationLw(FF)V

    return-void

    :cond_4
    :try_start_1
    iget-object v2, p0, Lcom/android/server/wm/DragState;->mSurfaceControl:Landroid/view/SurfaceControl;

    iget v3, p0, Lcom/android/server/wm/DragState;->mThumbOffsetX:F

    sub-float v3, p1, v3

    iget v4, p0, Lcom/android/server/wm/DragState;->mThumbOffsetY:F

    sub-float v4, p2, v4

    invoke-virtual {v2, v3, v4}, Landroid/view/SurfaceControl;->setPosition(FF)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v2

    invoke-static {}, Landroid/view/SurfaceControl;->closeTransaction()V

    sget-boolean v3, Lcom/android/server/wm/WindowManagerDebugConfig;->SHOW_LIGHT_TRANSACTIONS:Z

    if-eqz v3, :cond_5

    const-string/jumbo v3, "WindowManager"

    const-string/jumbo v4, "<<< CLOSE TRANSACTION notifyMoveLw"

    invoke-static {v3, v4}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    throw v2
.end method

.method overridePointerIconLw(I)V
    .locals 2

    iput p1, p0, Lcom/android/server/wm/DragState;->mTouchSource:I

    const/16 v0, 0x2002

    invoke-direct {p0, v0}, Lcom/android/server/wm/DragState;->isFromSource(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/hardware/input/InputManager;->getInstance()Landroid/hardware/input/InputManager;

    move-result-object v0

    const/16 v1, 0x3fd

    invoke-virtual {v0, v1}, Landroid/hardware/input/InputManager;->setPointerIconType(I)V

    :cond_0
    return-void
.end method

.method register(Landroid/view/Display;)V
    .locals 14

    const-wide v12, 0x12a05f200L

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v8, 0x0

    sget-boolean v4, Lcom/android/server/wm/WindowManagerDebugConfig;->DEBUG_DRAG:Z

    if-eqz v4, :cond_0

    const-string/jumbo v4, "WindowManager"

    const-string/jumbo v5, "registering drag input channel"

    invoke-static {v4, v5}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v4, p0, Lcom/android/server/wm/DragState;->mClientChannel:Landroid/view/InputChannel;

    if-eqz v4, :cond_1

    const-string/jumbo v4, "WindowManager"

    const-string/jumbo v5, "Duplicate register of drag input channel"

    invoke-static {v4, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    :cond_1
    iget-object v4, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {p1}, Landroid/view/Display;->getDisplayId()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/android/server/wm/WindowManagerService;->getDisplayContentLocked(I)Lcom/android/server/wm/DisplayContent;

    move-result-object v4

    iput-object v4, p0, Lcom/android/server/wm/DragState;->mDisplayContent:Lcom/android/server/wm/DisplayContent;

    const-string/jumbo v4, "drag"

    invoke-static {v4}, Landroid/view/InputChannel;->openInputChannelPair(Ljava/lang/String;)[Landroid/view/InputChannel;

    move-result-object v0

    aget-object v4, v0, v8

    iput-object v4, p0, Lcom/android/server/wm/DragState;->mServerChannel:Landroid/view/InputChannel;

    aget-object v4, v0, v10

    iput-object v4, p0, Lcom/android/server/wm/DragState;->mClientChannel:Landroid/view/InputChannel;

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mInputManager:Lcom/android/server/input/InputManagerService;

    iget-object v5, p0, Lcom/android/server/wm/DragState;->mServerChannel:Landroid/view/InputChannel;

    invoke-virtual {v4, v5, v9}, Lcom/android/server/input/InputManagerService;->registerInputChannel(Landroid/view/InputChannel;Lcom/android/server/input/InputWindowHandle;)V

    new-instance v4, Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;

    iget-object v5, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v6, p0, Lcom/android/server/wm/DragState;->mClientChannel:Landroid/view/InputChannel;

    iget-object v7, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v7, v7, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    invoke-virtual {v7}, Lcom/android/server/wm/WindowManagerService$H;->getLooper()Landroid/os/Looper;

    move-result-object v7

    invoke-direct {v4, v5, v6, v7}, Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;-><init>(Lcom/android/server/wm/WindowManagerService;Landroid/view/InputChannel;Landroid/os/Looper;)V

    iput-object v4, p0, Lcom/android/server/wm/DragState;->mInputEventReceiver:Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;

    new-instance v4, Lcom/android/server/input/InputApplicationHandle;

    invoke-direct {v4, v9}, Lcom/android/server/input/InputApplicationHandle;-><init>(Ljava/lang/Object;)V

    iput-object v4, p0, Lcom/android/server/wm/DragState;->mDragApplicationHandle:Lcom/android/server/input/InputApplicationHandle;

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragApplicationHandle:Lcom/android/server/input/InputApplicationHandle;

    const-string/jumbo v5, "drag"

    iput-object v5, v4, Lcom/android/server/input/InputApplicationHandle;->name:Ljava/lang/String;

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragApplicationHandle:Lcom/android/server/input/InputApplicationHandle;

    iput-wide v12, v4, Lcom/android/server/input/InputApplicationHandle;->dispatchingTimeoutNanos:J

    new-instance v4, Lcom/android/server/input/InputWindowHandle;

    iget-object v5, p0, Lcom/android/server/wm/DragState;->mDragApplicationHandle:Lcom/android/server/input/InputApplicationHandle;

    invoke-virtual {p1}, Landroid/view/Display;->getDisplayId()I

    move-result v6

    invoke-direct {v4, v5, v9, v6}, Lcom/android/server/input/InputWindowHandle;-><init>(Lcom/android/server/input/InputApplicationHandle;Ljava/lang/Object;I)V

    iput-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    const-string/jumbo v5, "drag"

    iput-object v5, v4, Lcom/android/server/input/InputWindowHandle;->name:Ljava/lang/String;

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    iget-object v5, p0, Lcom/android/server/wm/DragState;->mServerChannel:Landroid/view/InputChannel;

    iput-object v5, v4, Lcom/android/server/input/InputWindowHandle;->inputChannel:Landroid/view/InputChannel;

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    invoke-virtual {p0}, Lcom/android/server/wm/DragState;->getDragLayerLw()I

    move-result v5

    iput v5, v4, Lcom/android/server/input/InputWindowHandle;->layer:I

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    iput v8, v4, Lcom/android/server/input/InputWindowHandle;->layoutParamsFlags:I

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    const/16 v5, 0x7e0

    iput v5, v4, Lcom/android/server/input/InputWindowHandle;->layoutParamsType:I

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    iput-wide v12, v4, Lcom/android/server/input/InputWindowHandle;->dispatchingTimeoutNanos:J

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    iput-boolean v10, v4, Lcom/android/server/input/InputWindowHandle;->visible:Z

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    iput-boolean v8, v4, Lcom/android/server/input/InputWindowHandle;->canReceiveKeys:Z

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    iput-boolean v10, v4, Lcom/android/server/input/InputWindowHandle;->hasFocus:Z

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    iput-boolean v8, v4, Lcom/android/server/input/InputWindowHandle;->hasWallpaper:Z

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    iput-boolean v8, v4, Lcom/android/server/input/InputWindowHandle;->paused:Z

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v5

    iput v5, v4, Lcom/android/server/input/InputWindowHandle;->ownerPid:I

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v5

    iput v5, v4, Lcom/android/server/input/InputWindowHandle;->ownerUid:I

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    iput v8, v4, Lcom/android/server/input/InputWindowHandle;->inputFeatures:I

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    const/high16 v5, 0x3f800000    # 1.0f

    iput v5, v4, Lcom/android/server/input/InputWindowHandle;->scaleFactor:F

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    iget-object v4, v4, Lcom/android/server/input/InputWindowHandle;->touchableRegion:Landroid/graphics/Region;

    invoke-virtual {v4}, Landroid/graphics/Region;->setEmpty()V

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    iput v8, v4, Lcom/android/server/input/InputWindowHandle;->frameLeft:I

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    iput v8, v4, Lcom/android/server/input/InputWindowHandle;->frameTop:I

    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    :try_start_0
    invoke-virtual {p1, v1}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    iget v5, v1, Landroid/graphics/Point;->x:I

    iput v5, v4, Lcom/android/server/input/InputWindowHandle;->frameRight:I

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    iget v5, v1, Landroid/graphics/Point;->y:I

    iput v5, v4, Lcom/android/server/input/InputWindowHandle;->frameBottom:I

    sget-boolean v4, Lcom/android/server/wm/WindowManagerDebugConfig;->DEBUG_ORIENTATION:Z

    if-eqz v4, :cond_2

    const-string/jumbo v4, "WindowManager"

    const-string/jumbo v5, "Pausing rotation during drag"

    invoke-static {v4, v5}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    iget-object v4, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowManagerService;->pauseRotationLocked()V

    iget-object v4, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {p1}, Landroid/view/Display;->getDisplayId()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/android/server/wm/WindowManagerService;->getEasyOneHandScaleSpecLocked(I)Landroid/view/MagnificationSpec;

    move-result-object v4

    iput-object v4, p0, Lcom/android/server/wm/DragState;->mSpec:Landroid/view/MagnificationSpec;

    goto/16 :goto_0

    :catchall_0
    move-exception v4

    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v4
.end method

.method reset()V
    .locals 3

    const/4 v2, 0x0

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mSurfaceControl:Landroid/view/SurfaceControl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mSurfaceControl:Landroid/view/SurfaceControl;

    invoke-virtual {v0}, Landroid/view/SurfaceControl;->destroy()V

    :cond_0
    iput-object v1, p0, Lcom/android/server/wm/DragState;->mSurfaceControl:Landroid/view/SurfaceControl;

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/wm/DragState;->mFlags:I

    iput-object v1, p0, Lcom/android/server/wm/DragState;->mLocalWin:Landroid/os/IBinder;

    iput-object v1, p0, Lcom/android/server/wm/DragState;->mToken:Landroid/os/IBinder;

    iput-object v1, p0, Lcom/android/server/wm/DragState;->mData:Landroid/content/ClipData;

    iput v2, p0, Lcom/android/server/wm/DragState;->mThumbOffsetY:F

    iput v2, p0, Lcom/android/server/wm/DragState;->mThumbOffsetX:F

    iput-object v1, p0, Lcom/android/server/wm/DragState;->mNotifiedWindows:Ljava/util/ArrayList;

    iput-object v1, p0, Lcom/android/server/wm/DragState;->mTmpMatrix:Landroid/graphics/Matrix;

    return-void
.end method

.method sendDragStartedIfNeededLw(Lcom/android/server/wm/WindowState;)V
    .locals 3

    iget-boolean v0, p0, Lcom/android/server/wm/DragState;->mDragInProgress:Z

    if-eqz v0, :cond_2

    invoke-direct {p0, p1}, Lcom/android/server/wm/DragState;->isWindowNotified(Lcom/android/server/wm/WindowState;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    sget-boolean v0, Lcom/android/server/wm/WindowManagerDebugConfig;->DEBUG_DRAG:Z

    if-eqz v0, :cond_1

    const-string/jumbo v0, "WindowManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "need to send DRAG_STARTED to new window "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget v0, p0, Lcom/android/server/wm/DragState;->mCurrentX:F

    iget v1, p0, Lcom/android/server/wm/DragState;->mCurrentY:F

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mDataDescription:Landroid/content/ClipDescription;

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/android/server/wm/DragState;->sendDragStartedLw(Lcom/android/server/wm/WindowState;FFLandroid/content/ClipDescription;)V

    :cond_2
    return-void
.end method

.method stepAnimationLocked(J)Z
    .locals 9

    const/4 v8, 0x1

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mAnimation:Landroid/view/animation/Animation;

    if-nez v2, :cond_0

    return v6

    :cond_0
    iget-object v2, p0, Lcom/android/server/wm/DragState;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v2}, Landroid/view/animation/Transformation;->clear()V

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mAnimation:Landroid/view/animation/Animation;

    iget-object v3, p0, Lcom/android/server/wm/DragState;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v2, p1, p2, v3}, Landroid/view/animation/Animation;->getTransformation(JLandroid/view/animation/Transformation;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-direct {p0}, Lcom/android/server/wm/DragState;->cleanUpDragLw()V

    return v6

    :cond_1
    iget-object v2, p0, Lcom/android/server/wm/DragState;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v2}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    iget v3, p0, Lcom/android/server/wm/DragState;->mCurrentX:F

    iget v4, p0, Lcom/android/server/wm/DragState;->mThumbOffsetX:F

    sub-float/2addr v3, v4

    iget v4, p0, Lcom/android/server/wm/DragState;->mCurrentY:F

    iget v5, p0, Lcom/android/server/wm/DragState;->mThumbOffsetY:F

    sub-float/2addr v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mDragState:Lcom/android/server/wm/DragState;

    iget-object v0, v2, Lcom/android/server/wm/DragState;->mTmpMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mTargetWindow:Lcom/android/server/wm/WindowState;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mTargetWindow:Lcom/android/server/wm/WindowState;

    iget-boolean v2, v2, Lcom/android/server/wm/WindowState;->mDssEnabled:Z

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mTargetWindow:Lcom/android/server/wm/WindowState;

    iget v2, v2, Lcom/android/server/wm/WindowState;->mDssScale:F

    div-float v2, v7, v2

    iget-object v3, p0, Lcom/android/server/wm/DragState;->mTargetWindow:Lcom/android/server/wm/WindowState;

    iget v3, v3, Lcom/android/server/wm/WindowState;->mDssScale:F

    div-float v3, v7, v3

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->postScale(FF)Z

    :cond_2
    iget-object v2, p0, Lcom/android/server/wm/DragState;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v2}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-boolean v2, v2, Lcom/android/server/wm/WindowManagerService;->mReduceScreenRunning:Z

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mSpec:Landroid/view/MagnificationSpec;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mSpec:Landroid/view/MagnificationSpec;

    invoke-virtual {v2}, Landroid/view/MagnificationSpec;->isNop()Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    :goto_0
    iget-object v2, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v1, v2, Lcom/android/server/wm/WindowManagerService;->mTmpFloats:[F

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->getValues([F)V

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mSurfaceControl:Landroid/view/SurfaceControl;

    const/4 v3, 0x2

    aget v3, v1, v3

    const/4 v4, 0x5

    aget v4, v1, v4

    invoke-virtual {v2, v3, v4}, Landroid/view/SurfaceControl;->setPosition(FF)V

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mSurfaceControl:Landroid/view/SurfaceControl;

    iget-object v3, p0, Lcom/android/server/wm/DragState;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v3}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/SurfaceControl;->setAlpha(F)V

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mSurfaceControl:Landroid/view/SurfaceControl;

    aget v3, v1, v6

    const/4 v4, 0x3

    aget v4, v1, v4

    aget v5, v1, v8

    const/4 v6, 0x4

    aget v6, v1, v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/view/SurfaceControl;->setMatrix(FFFF)V

    return v8

    :cond_4
    iget-object v2, p0, Lcom/android/server/wm/DragState;->mSpec:Landroid/view/MagnificationSpec;

    iget v2, v2, Landroid/view/MagnificationSpec;->scale:F

    iget-object v3, p0, Lcom/android/server/wm/DragState;->mSpec:Landroid/view/MagnificationSpec;

    iget v3, v3, Landroid/view/MagnificationSpec;->scale:F

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->postScale(FF)Z

    iget-object v2, p0, Lcom/android/server/wm/DragState;->mSpec:Landroid/view/MagnificationSpec;

    iget v2, v2, Landroid/view/MagnificationSpec;->offsetX:F

    iget-object v3, p0, Lcom/android/server/wm/DragState;->mSpec:Landroid/view/MagnificationSpec;

    iget v3, v3, Landroid/view/MagnificationSpec;->offsetY:F

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_0
.end method

.method unregister()V
    .locals 3

    const/4 v2, 0x0

    sget-boolean v0, Lcom/android/server/wm/WindowManagerDebugConfig;->DEBUG_DRAG:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "WindowManager"

    const-string/jumbo v1, "unregistering drag input channel"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Lcom/android/server/wm/DragState;->mClientChannel:Landroid/view/InputChannel;

    if-nez v0, :cond_1

    const-string/jumbo v0, "WindowManager"

    const-string/jumbo v1, "Unregister of nonexistent drag input channel"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mInputManager:Lcom/android/server/input/InputManagerService;

    iget-object v1, p0, Lcom/android/server/wm/DragState;->mServerChannel:Landroid/view/InputChannel;

    invoke-virtual {v0, v1}, Lcom/android/server/input/InputManagerService;->unregisterInputChannel(Landroid/view/InputChannel;)V

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mInputEventReceiver:Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;

    invoke-virtual {v0}, Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;->dispose()V

    iput-object v2, p0, Lcom/android/server/wm/DragState;->mInputEventReceiver:Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mClientChannel:Landroid/view/InputChannel;

    invoke-virtual {v0}, Landroid/view/InputChannel;->dispose()V

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mServerChannel:Landroid/view/InputChannel;

    invoke-virtual {v0}, Landroid/view/InputChannel;->dispose()V

    iput-object v2, p0, Lcom/android/server/wm/DragState;->mClientChannel:Landroid/view/InputChannel;

    iput-object v2, p0, Lcom/android/server/wm/DragState;->mServerChannel:Landroid/view/InputChannel;

    iput-object v2, p0, Lcom/android/server/wm/DragState;->mDragWindowHandle:Lcom/android/server/input/InputWindowHandle;

    iput-object v2, p0, Lcom/android/server/wm/DragState;->mDragApplicationHandle:Lcom/android/server/input/InputApplicationHandle;

    sget-boolean v0, Lcom/android/server/wm/WindowManagerDebugConfig;->DEBUG_ORIENTATION:Z

    if-eqz v0, :cond_2

    const-string/jumbo v0, "WindowManager"

    const-string/jumbo v1, "Resuming rotation after drag"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    iget-object v0, p0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v0}, Lcom/android/server/wm/WindowManagerService;->resumeRotationLocked()V

    goto :goto_0
.end method
