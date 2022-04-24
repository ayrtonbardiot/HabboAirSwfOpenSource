// by nota

//_-XO._SafeStr_782

package _-XO
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_782 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_782(_arg_1:int, _arg_2:Array)
        {
            var _local_3:int;
            super();
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2.length);
            _local_3 = 0;
            while (_local_3 < _arg_2.length)
            {
                _SafeStr_3740.push(_arg_2[_local_3]);
                _local_3++;
            };
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
        }


    }
}//package _-XO

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_782 = "_-n11" (String#9849, DoABC#3)


