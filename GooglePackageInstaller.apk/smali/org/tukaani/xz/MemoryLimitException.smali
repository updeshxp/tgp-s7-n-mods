.class public Lorg/tukaani/xz/MemoryLimitException;
.super Lorg/tukaani/xz/XZIOException;
.source "MemoryLimitException.java"


# static fields
.field private static final serialVersionUID:J = 0x3L


# instance fields
.field private final memoryLimit:I

.field private final memoryNeeded:I


# direct methods
.method public constructor <init>(II)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " KiB of memory would be needed; limit was "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " KiB"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    iput p1, p0, Lorg/tukaani/xz/MemoryLimitException;->memoryNeeded:I

    iput p2, p0, Lorg/tukaani/xz/MemoryLimitException;->memoryLimit:I

    return-void
.end method
