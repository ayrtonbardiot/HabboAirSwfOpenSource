// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-02a._SafeStr_527

package _-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_527 implements IMessageComposer 
    {

        private var _SafeStr_4157:int;
        private var _SafeStr_7008:String;

        public function _SafeStr_527(_arg_1:int, _arg_2:String)
        {
            _SafeStr_4157 = _arg_1;
            _SafeStr_7008 = _arg_2;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4157, _SafeStr_7008]);
        }

        public function dispose():void
        {
        }


    }
}//package _-02a

// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)
// _SafeStr_527 = "_-81T" (String#7082, DoABC#3)
// _SafeStr_7008 = "_-J7" (String#7794, DoABC#3)


