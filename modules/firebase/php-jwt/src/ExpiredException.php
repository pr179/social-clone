<?php
namespace Firebase\JWT;
require_once("../../modules/firebase/php-jwt/src/JWTExceptionWithPayloadInterface.php");

class ExpiredException extends \UnexpectedValueException implements JWTExceptionWithPayloadInterface
{
    private object $payload;

    public function setPayload(object $payload): void
    {
        $this->payload = $payload;
    }

    public function getPayload(): object
    {
        return $this->payload;
    }
}
