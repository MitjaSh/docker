# --- Этап 1: Сборка расширения ---
FROM postgres:14.3-alpine AS builder

# Устанавливаем необходимые инструменты для сборки
RUN apk add --no-cache \
    gcc \
    make \
    musl-dev \
    clang \
    llvm \
    postgresql-dev \
    curl

# Вместо curl используем локальный файл из контекста сборки
COPY plpgsql_check-2.3.0.tar.gz /tmp/plpgsql_check-2.3.0.tar.gz

RUN cd /tmp \
    && tar -xf plpgsql_check-2.3.0.tar.gz \
    && cd plpgsql_check-2.3.0 \
    && make \
    && make install

# --- Этап 2: Финальный чистый образ ---
FROM postgres:14.3-alpine

# Копируем только собранные файлы расширения из первого этапа
COPY --from=builder /usr/local/lib/postgresql/plpgsql_check.so /usr/local/lib/postgresql/
COPY --from=builder /usr/local/share/postgresql/extension/plpgsql_check* /usr/local/share/postgresql/extension/
