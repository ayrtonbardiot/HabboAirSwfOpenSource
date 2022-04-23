// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-yL._SafeStr_274

package _-yL
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.utils.Dictionary;
    import _-K1r._SafeStr_1167;
    import flash.utils.describeType;

    [SecureSWF(rename="true")]
    public class _SafeStr_274 extends MessageEvent implements IMessageEvent 
    {

        public static const _SafeStr_7801:int = -1;
        public static const _SafeStr_7802:int = -2;
        public static const _SafeStr_7803:int = -3;
        public static const _SafeStr_7804:int = 0;
        public static const _SafeStr_7805:int = 1;
        public static const _SafeStr_7806:int = 2;
        public static const _SafeStr_7807:int = 3;
        public static const _SafeStr_7808:int = 4;
        public static const _SafeStr_7809:int = 5;
        public static const _SafeStr_7810:int = 10;
        public static const _SafeStr_7811:int = 11;
        public static const _SafeStr_7812:int = 12;
        public static const _SafeStr_7813:int = 13;
        public static const _SafeStr_7814:int = 16;
        public static const _SafeStr_7815:int = 17;
        public static const _SafeStr_7816:int = 18;
        public static const _SafeStr_7817:int = 19;
        public static const _SafeStr_7818:int = 20;
        public static const _SafeStr_7819:int = 22;
        public static const _SafeStr_7820:int = 23;
        public static const _SafeStr_7821:int = 24;
        public static const _SafeStr_7822:int = 25;
        public static const _SafeStr_7823:int = 26;
        public static const _SafeStr_7824:int = 27;
        public static const _SafeStr_7825:int = 28;
        public static const _SafeStr_7826:int = 29;
        public static const _SafeStr_7827:int = 100;
        public static const _SafeStr_7828:int = 101;
        public static const _SafeStr_7829:int = 102;
        public static const _SafeStr_7830:int = 103;
        public static const _SafeStr_7831:int = 104;
        public static const _SafeStr_7832:int = 105;
        public static const _SafeStr_7833:int = 106;
        public static const _SafeStr_7834:int = 107;
        public static const _SafeStr_7835:int = 108;
        public static const _SafeStr_7836:int = 109;
        public static const _SafeStr_7837:int = 110;
        public static const _SafeStr_7838:int = 111;
        public static const _SafeStr_7839:int = 112;
        public static const _SafeStr_7840:int = 113;
        public static const _SafeStr_7841:int = 114;
        public static const _SafeStr_7842:int = 115;
        public static const _SafeStr_7843:int = 116;
        public static const SOCKET_WRITE_EXCEPTION_1:int = 117;
        public static const SOCKET_WRITE_EXCEPTION_2:int = 118;
        public static const SOCKET_WRITE_EXCEPTION_3:int = 119;
        public static const _SafeStr_7844:int = 120;
        public static const _SafeStr_7845:int = 121;
        public static const _SafeStr_7846:int = 122;
        public static const _SafeStr_7847:int = 123;
        public static const _SafeStr_7848:int = 124;
        public static const _SafeStr_7849:int = 125;
        public static const _SafeStr_7850:int = 126;

        private static var _SafeStr_7851:Dictionary;

        public function _SafeStr_274(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1167);
        }

        public static function resolveDisconnectedReasonLocalizationKey(_arg_1:int):String
        {
            switch (_arg_1)
            {
                case -2:
                    return ("${disconnected.maintenance}");
                case 0:
                    return ("${disconnected.logged_out}");
                case 1:
                    return ("${disconnected.just_banned}");
                case 10:
                    return ("${disconnected.still_banned}");
                case 2:
                case 13:
                case 11:
                case 18:
                    return ("${disconnected.concurrent_login}");
                case 12:
                case 19:
                    return ("${disconnected.hotel_closed}");
                case 20:
                    return ("${disconnected.incorrect_password}");
                case 112:
                    return ("${disconnected.idle}");
                case 122:
                    return ("${disconnected.incompatible_client_version}");
                case 4:
                case 5:
                case 16:
                case 17:
                case 22:
                case 23:
                case 24:
                case 25:
                case 26:
                case 27:
                case 28:
                case 29:
                case 100:
                case 101:
                case 102:
                case 103:
                case 104:
                case 105:
                case 106:
                case 107:
                case 108:
                case 109:
                case 110:
                case 111:
                case 113:
                case 114:
                case 115:
                case 116:
                case 117:
                case 118:
                case 119:
                case 120:
                case 121:
                case 123:
                case 124:
                case 125:
                case 126:
                    return ("${disconnected.generic}");
                default:
                    return ("${disconnected.generic}");
            };
        }


        public function get reason():int
        {
            return ((this._SafeStr_7012 as _SafeStr_1167).reason);
        }

        public function get reasonString():String
        {
            switch (reason)
            {
                case 1:
                case 10:
                    return ("banned");
                case 2:
                    return ("concurrentlogin");
                case 20:
                    return ("incorrectpassword");
                default:
                    return ("logout");
            };
        }

        public function getReasonName():String
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            if (_SafeStr_7851 == null)
            {
                _SafeStr_7851 = new Dictionary();
                _local_2 = describeType(_SafeStr_274);
                for each (var _local_1:XML in _local_2.constant)
                {
                    _local_3 = _local_1.@name;
                    _local_4 = _SafeStr_274[_local_1.@name];
                    _SafeStr_7851[_local_4] = _local_3;
                };
            };
            return (_SafeStr_7851[reason]);
        }


    }
}//package _-yL

// _SafeStr_1167 = "_-pu" (String#10025, DoABC#3)
// _SafeStr_274 = "_-Kp" (String#7925, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_7801 = "_-p1v" (String#10000, DoABC#3)
// _SafeStr_7802 = "_-P1P" (String#8237, DoABC#3)
// _SafeStr_7803 = "_-X1t" (String#8786, DoABC#3)
// _SafeStr_7804 = "_-xx" (String#10575, DoABC#3)
// _SafeStr_7805 = "_-Of" (String#8185, DoABC#3)
// _SafeStr_7806 = "_-k1J" (String#9671, DoABC#3)
// _SafeStr_7807 = "_-c0" (String#9100, DoABC#3)
// _SafeStr_7808 = "_-n1e" (String#9883, DoABC#3)
// _SafeStr_7809 = "_-w1s" (String#10467, DoABC#3)
// _SafeStr_7810 = "_-R1i" (String#8351, DoABC#3)
// _SafeStr_7811 = "_-W1g" (String#8718, DoABC#3)
// _SafeStr_7812 = "_-lC" (String#9767, DoABC#3)
// _SafeStr_7813 = "_-p1D" (String#9977, DoABC#3)
// _SafeStr_7814 = "_-Tt" (String#8536, DoABC#3)
// _SafeStr_7815 = "_-jV" (String#9637, DoABC#3)
// _SafeStr_7816 = "_-Tj" (String#8529, DoABC#3)
// _SafeStr_7817 = "_-7s" (String#7061, DoABC#3)
// _SafeStr_7818 = "_-d11" (String#9167, DoABC#3)
// _SafeStr_7819 = "_-f1X" (String#9337, DoABC#3)
// _SafeStr_7820 = "_-51S" (String#6884, DoABC#3)
// _SafeStr_7821 = "_-Hu" (String#7711, DoABC#3)
// _SafeStr_7822 = "_-dF" (String#9234, DoABC#3)
// _SafeStr_7823 = "_-I5" (String#7739, DoABC#3)
// _SafeStr_7824 = "_-oK" (String#9953, DoABC#3)
// _SafeStr_7825 = "_-12A" (String#6565, DoABC#3)
// _SafeStr_7826 = "_-X18" (String#8766, DoABC#3)
// _SafeStr_7827 = "_-12k" (String#6579, DoABC#3)
// _SafeStr_7828 = "_-M1l" (String#8014, DoABC#3)
// _SafeStr_7829 = "_-I" (String#7712, DoABC#3)
// _SafeStr_7830 = "_-wW" (String#10484, DoABC#3)
// _SafeStr_7831 = "_-qm" (String#10091, DoABC#3)
// _SafeStr_7832 = "_-Hi" (String#7707, DoABC#3)
// _SafeStr_7833 = "_-q1a" (String#10054, DoABC#3)
// _SafeStr_7834 = "_-Yg" (String#8877, DoABC#3)
// _SafeStr_7835 = "_-21o" (String#6652, DoABC#3)
// _SafeStr_7836 = "_-B1n" (String#7320, DoABC#3)
// _SafeStr_7837 = "_-Z1j" (String#8908, DoABC#3)
// _SafeStr_7838 = "_-s" (String#10173, DoABC#3)
// _SafeStr_7839 = "_-UF" (String#8573, DoABC#3)
// _SafeStr_7840 = "_-4e" (String#6859, DoABC#3)
// _SafeStr_7841 = "_-Fk" (String#7577, DoABC#3)
// _SafeStr_7842 = "_-y8" (String#10614, DoABC#3)
// _SafeStr_7843 = "_-W1L" (String#8705, DoABC#3)
// _SafeStr_7844 = "_-h11" (String#9444, DoABC#3)
// _SafeStr_7845 = "_-pj" (String#10018, DoABC#3)
// _SafeStr_7846 = "_-S17" (String#8398, DoABC#3)
// _SafeStr_7847 = "_-C2" (String#7378, DoABC#3)
// _SafeStr_7848 = "_-01d" (String#6487, DoABC#3)
// _SafeStr_7849 = "_-jA" (String#9617, DoABC#3)
// _SafeStr_7850 = "_-R13" (String#8336, DoABC#3)
// _SafeStr_7851 = "_-I1E" (String#7719, DoABC#3)


