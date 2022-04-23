// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.hurlant.crypto.tls.TLSError

package com.hurlant.crypto.tls
{
    public class TLSError extends Error 
    {

        public static const _SafeStr_7980:uint = 0;
        public static const _SafeStr_7981:uint = 10;
        public static const bad_record_mac:uint = 20;
        public static const decryption_failed:uint = 21;
        public static const record_overflow:uint = 22;
        public static const decompression_failure:uint = 30;
        public static const handshake_failure:uint = 40;
        public static const bad_certificate:uint = 42;
        public static const _SafeStr_7982:uint = 43;
        public static const _SafeStr_7983:uint = 44;
        public static const _SafeStr_7984:uint = 45;
        public static const _SafeStr_7985:uint = 46;
        public static const _SafeStr_7986:uint = 47;
        public static const unknown_ca:uint = 48;
        public static const access_denied:uint = 49;
        public static const decode_error:uint = 50;
        public static const decrypt_error:uint = 51;
        public static const protocol_version:uint = 70;
        public static const insufficient_security:uint = 71;
        public static const internal_error:uint = 80;
        public static const user_canceled:uint = 90;
        public static const no_renegotiation:uint = 100;

        public function TLSError(_arg_1:String, _arg_2:int)
        {
            super(_arg_1, _arg_2);
        }

    }
}//package com.hurlant.crypto.tls

// _SafeStr_7980 = "_-qb" (String#32281, DoABC#4)
// _SafeStr_7981 = "_-f11" (String#37899, DoABC#4)
// _SafeStr_7982 = "_-41j" (String#32976, DoABC#4)
// _SafeStr_7983 = "_-e7" (String#31711, DoABC#4)
// _SafeStr_7984 = "_-g2" (String#32370, DoABC#4)
// _SafeStr_7985 = "_-1F" (String#39020, DoABC#4)
// _SafeStr_7986 = "_-gF" (String#31786, DoABC#4)


