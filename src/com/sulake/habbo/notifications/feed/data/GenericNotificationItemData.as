// by nota

//com.sulake.habbo.notifications.feed.data.GenericNotificationItemData

package com.sulake.habbo.notifications.feed.data
{
    import flash.display.BitmapData;

    public class GenericNotificationItemData 
    {

        private var _SafeStr_4004:String;
        private var _SafeStr_5415:int;
        private var _description:String;
        private var _SafeStr_6277:BitmapData;
        private var _SafeStr_5214:BitmapData;
        private var _buttonAction:String;
        private var _buttonCaption:String;


        public function get title():String
        {
            return (_SafeStr_4004);
        }

        public function get timeStamp():int
        {
            return (_SafeStr_5415);
        }

        public function get description():String
        {
            return (_description);
        }

        public function get decorationImage():BitmapData
        {
            return (_SafeStr_6277);
        }

        public function get iconImage():BitmapData
        {
            return (_SafeStr_5214);
        }

        public function get buttonAction():String
        {
            return (_buttonAction);
        }

        public function get buttonCaption():String
        {
            return (_buttonCaption);
        }

        public function set title(_arg_1:String):void
        {
            _SafeStr_4004 = _arg_1;
        }

        public function set timeStamp(_arg_1:int):void
        {
            _SafeStr_5415 = _arg_1;
        }

        public function set description(_arg_1:String):void
        {
            _description = _arg_1;
        }

        public function set decorationImage(_arg_1:BitmapData):void
        {
            _SafeStr_6277 = _arg_1;
        }

        public function set iconImage(_arg_1:BitmapData):void
        {
            _SafeStr_5214 = _arg_1;
        }

        public function set buttonAction(_arg_1:String):void
        {
            _buttonAction = _arg_1;
        }

        public function set buttonCaption(_arg_1:String):void
        {
            _buttonCaption = _arg_1;
        }


    }
}//package com.sulake.habbo.notifications.feed.data

// _SafeStr_4004 = "_-41o" (String#1978, DoABC#4)
// _SafeStr_5214 = "_-D1k" (String#2378, DoABC#4)
// _SafeStr_5415 = "_-f15" (String#4009, DoABC#4)
// _SafeStr_6277 = "_-g1H" (String#15853, DoABC#4)


