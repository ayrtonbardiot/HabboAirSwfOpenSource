// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-j1G._SafeStr_980

package _-j1G
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_980 implements IMessageComposer 
    {

        private var _SafeStr_5431:int;
        private var _SafeStr_7271:Boolean;

        public function _SafeStr_980(_arg_1:int, _arg_2:Boolean)
        {
            _SafeStr_5431 = _arg_1;
            _SafeStr_7271 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_5431, _SafeStr_7271]);
        }


    }
}//package _-j1G

// _SafeStr_5431 = "_-GK" (String#7627, DoABC#3)
// _SafeStr_7271 = "_-7H" (String#7042, DoABC#3)
// _SafeStr_980 = "_-F13" (String#7528, DoABC#3)


