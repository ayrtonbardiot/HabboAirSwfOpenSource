// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-j1G._SafeStr_626

package _-j1G
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_626 implements IMessageComposer 
    {

        private var _SafeStr_4157:int;
        private var _SafeStr_4750:int;
        private var _wallLocation:String;
        private var _SafeStr_4050:int = 0;
        private var _SafeStr_4051:int = 0;
        private var _SafeStr_4049:int = 0;

        public function _SafeStr_626(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:int)
        {
            _SafeStr_4157 = _arg_1;
            _SafeStr_4750 = _arg_2;
            _wallLocation = _arg_3;
            _SafeStr_4050 = _arg_4;
            _SafeStr_4051 = _arg_5;
            _SafeStr_4049 = _arg_6;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            switch (_SafeStr_4750)
            {
                case 10:
                    return ([((((((_SafeStr_4157 + " ") + _SafeStr_4050) + " ") + _SafeStr_4051) + " ") + _SafeStr_4049)]);
                case 20:
                    return ([((_SafeStr_4157 + " ") + _wallLocation)]);
                default:
                    return ([]);
                    return; //dead code
            };
        }


    }
}//package _-j1G

// _SafeStr_4049 = "_-W12" (String#8660, DoABC#3)
// _SafeStr_4050 = "_-22N" (String#6666, DoABC#3)
// _SafeStr_4051 = "_-1L" (String#6600, DoABC#3)
// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)
// _SafeStr_4750 = "_-E1d" (String#7477, DoABC#3)
// _SafeStr_626 = "_-xZ" (String#10565, DoABC#3)


