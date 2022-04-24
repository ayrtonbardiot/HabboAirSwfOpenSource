// by nota

//_-CV.SnowWarGameEventData

package _-CV
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowWarGameEventData 
    {

        public static const _SafeStr_7193:int = 1;
        public static const _SafeStr_7194:int = 2;
        public static const _SafeStr_7195:int = 3;
        public static const _SafeStr_7196:int = 4;
        public static const _SafeStr_7197:int = 7;
        public static const _SafeStr_7198:int = 8;
        public static const _SafeStr_7199:int = 11;
        public static const _SafeStr_7200:int = 12;

        private var _SafeStr_3820:int;

        public function SnowWarGameEventData(_arg_1:int)
        {
            _SafeStr_3820 = _arg_1;
        }

        public static function create(_arg_1:int):SnowWarGameEventData
        {
            switch (_arg_1)
            {
                case 2:
                    return (new NewMoveTargetEventData(_arg_1));
                case 3:
                    return (new HumanThrowsSnowballAtHumanEventData(_arg_1));
                case 4:
                    return (new HumanThrowsSnowballAtPositionEventData(_arg_1));
                case 7:
                    return (new HumanStartsToMakeASnowballEventData(_arg_1));
                case 8:
                    return (new CreateSnowballEventData(_arg_1));
                case 11:
                    return (new MachineCreatesSnowballEventData(_arg_1));
                case 12:
                    return (new HumanGetsSnowballsFromMachineEventData(_arg_1));
                case 1:
                    return (new HumanLeftGameEventData(_arg_1));
                default:
                    return (null);
            };
        }


        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function set id(_arg_1:int):void
        {
            _SafeStr_3820 = _arg_1;
        }

        public function parse(_arg_1:IMessageDataWrapper):void
        {
        }


    }
}//package _-CV

// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_7193 = "_-K1O" (String#7872, DoABC#3)
// _SafeStr_7194 = "_-02Y" (String#6512, DoABC#3)
// _SafeStr_7195 = "_-8r" (String#7142, DoABC#3)
// _SafeStr_7196 = "_-61l" (String#6970, DoABC#3)
// _SafeStr_7197 = "_-GB" (String#7622, DoABC#3)
// _SafeStr_7198 = "_-YG" (String#8864, DoABC#3)
// _SafeStr_7199 = "_-xD" (String#10552, DoABC#3)
// _SafeStr_7200 = "_-Yt" (String#8881, DoABC#3)


