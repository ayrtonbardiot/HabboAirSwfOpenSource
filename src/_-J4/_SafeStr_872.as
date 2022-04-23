// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-J4._SafeStr_872

package _-J4
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_872 implements IMessageComposer 
    {

        private var _SafeStr_6600:Array;

        public function _SafeStr_872(_arg_1:String, _arg_2:int=-1, _arg_3:int=-1, _arg_4:int=-1, _arg_5:int=-1, _arg_6:int=-1, _arg_7:int=-1)
        {
            if ((((((_arg_2 == -1) && (_arg_3 == -1)) && (_arg_4 == -1)) && (_arg_5 == -1)) && (_arg_6 == -1)))
            {
                _SafeStr_6600 = [_arg_1];
            }
            else
            {
                if (_arg_7 == -1)
                {
                    _SafeStr_6600 = [_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6];
                }
                else
                {
                    _SafeStr_6600 = [_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7];
                };
            };
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_6600);
        }

        public function dispose():void
        {
            _SafeStr_6600 = null;
        }


    }
}//package _-J4

// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_872 = "_-7c" (String#7052, DoABC#3)


