// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_1289

package _-AE
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1289 
    {

        private var _SafeStr_4426:Boolean;
        private var _icon:int;
        private var _SafeStr_4786:int;
        private var _pageName:String;
        private var _localization:String;
        private var _children:Vector.<_SafeStr_1289>;
        private var _offerIds:Vector.<int>;

        public function _SafeStr_1289(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            super();
            _SafeStr_4426 = _arg_1.readBoolean();
            _icon = _arg_1.readInteger();
            _SafeStr_4786 = _arg_1.readInteger();
            _pageName = _arg_1.readString();
            _localization = _arg_1.readString();
            _offerIds = new Vector.<int>(0);
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _offerIds.push(_arg_1.readInteger());
                _local_3++;
            };
            _children = new Vector.<_SafeStr_1289>(0);
            var _local_4:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_4)
            {
                _children.push(new _SafeStr_1289(_arg_1));
                _local_3++;
            };
        }

        public function get visible():Boolean
        {
            return (_SafeStr_4426);
        }

        public function get icon():int
        {
            return (_icon);
        }

        public function get pageId():int
        {
            return (_SafeStr_4786);
        }

        public function get pageName():String
        {
            return (_pageName);
        }

        public function get localization():String
        {
            return (_localization);
        }

        public function get children():Vector.<_SafeStr_1289>
        {
            return (_children);
        }

        public function get offerIds():Vector.<int>
        {
            return (_offerIds);
        }


    }
}//package _-AE

// _SafeStr_1289 = "_-H1D" (String#7664, DoABC#3)
// _SafeStr_4426 = "_-c1l" (String#9123, DoABC#3)
// _SafeStr_4786 = "_-l1k" (String#9753, DoABC#3)


