// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-p1Y._SafeStr_229

package _-p1Y
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_229 implements IMessageComposer 
    {

        private var _SafeStr_4128:int;
        private var _SafeStr_3693:int = 0;
        private var _SafeStr_7490:int;

        public function _SafeStr_229(_arg_1:int, _arg_2:int, _arg_3:int=0)
        {
            _SafeStr_4128 = _arg_1;
            _SafeStr_3693 = _arg_3;
            _SafeStr_7490 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4128, _SafeStr_3693, _SafeStr_7490]);
        }


    }
}//package _-p1Y

// _SafeStr_229 = "_-v18" (String#10379, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_7490 = "_-vn" (String#10424, DoABC#3)


