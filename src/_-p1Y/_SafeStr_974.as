// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-p1Y._SafeStr_974

package _-p1Y
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_974 implements IMessageComposer 
    {

        private var _SafeStr_4128:int;

        public function _SafeStr_974(_arg_1:int)
        {
            _SafeStr_4128 = _arg_1;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4128]);
        }


    }
}//package _-p1Y

// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_974 = "_-y1m" (String#10597, DoABC#3)


