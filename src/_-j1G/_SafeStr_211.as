// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-j1G._SafeStr_211

package _-j1G
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_211 implements IMessageComposer 
    {

        private var _SafeStr_4157:int;
        private var _SafeStr_4750:int;

        public function _SafeStr_211(_arg_1:int, _arg_2:int)
        {
            _SafeStr_4157 = _arg_1;
            _SafeStr_4750 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var _local_1:int;
            switch (_SafeStr_4750)
            {
                case 10:
                    _local_1 = 2;
                    break;
                case 20:
                    _local_1 = 1;
                    break;
                default:
                    return ([]);
            };
            return ([_local_1, _SafeStr_4157]);
        }


    }
}//package _-j1G

// _SafeStr_211 = "_-n1n" (String#9887, DoABC#3)
// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)
// _SafeStr_4750 = "_-E1d" (String#7477, DoABC#3)


