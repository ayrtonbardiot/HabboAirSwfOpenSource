// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-02a._SafeStr_690

package _-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_690 implements IMessageComposer 
    {

        private var _SafeStr_7007:int;
        private var _location:String;

        public function _SafeStr_690(_arg_1:int, _arg_2:String)
        {
            _SafeStr_7007 = _arg_1;
            _location = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_7007, _location]);
        }


    }
}//package _-02a

// _SafeStr_690 = "_-4y" (String#6867, DoABC#3)
// _SafeStr_7007 = "_-J1n" (String#7783, DoABC#3)


