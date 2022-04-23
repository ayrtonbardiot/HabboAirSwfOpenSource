// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-j1G._SafeStr_225

package _-j1G
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_225 implements IMessageComposer 
    {

        private var _SafeStr_4157:int = 0;

        public function _SafeStr_225(_arg_1:int)
        {
            _SafeStr_4157 = _arg_1;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4157]);
        }


    }
}//package _-j1G

// _SafeStr_225 = "_-1e" (String#6614, DoABC#3)
// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)


