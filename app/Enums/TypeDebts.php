<?php

namespace App\Enums;

enum TypeDebts: string
{
    case I_LEND = 'Yo presto';
    case LEND_ME = 'Me prestan';

    public function getId(): int
    {
        return match($this) {
            self::I_LEND => 1,
            self::LEND_ME => 2,
        };
    }

    public function getName(): string
    {
        return $this->value;
    }

    public static function getAll(): array
    {
        return [
            self::I_LEND->getId() => self::I_LEND->getName(),
            self::LEND_ME->getId() => self::LEND_ME->getName(),
        ];
    }

    public static function fromId(int $id): ?self
    {
        return match($id) {
            1 => self::I_LEND,
            2 => self::LEND_ME,
            default => null,
        };
    }

    public static function getIds(): array
    {
        return array_map(fn($case) => $case->getId(), self::cases());
    }
}
