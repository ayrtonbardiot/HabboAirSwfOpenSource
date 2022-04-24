// by nota

//_-51c._SafeStr_273

package _-51c
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_273 implements IMessageComposer 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_273(_arg_1:String, _arg_2:Array)
        {
            var _local_3:int;
            super();
            _SafeStr_6600.push(_arg_1);
            _SafeStr_6600.push(_arg_2.length);
            _local_3 = 0;
            while (_local_3 < _arg_2.length)
            {
                _SafeStr_6600.push(_arg_2[_local_3]);
                _local_3++;
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
}//package _-51c

// _SafeStr_273 = "_-z16" (String#10654, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


