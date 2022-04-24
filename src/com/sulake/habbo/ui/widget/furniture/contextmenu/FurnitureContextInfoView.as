// by nota

//com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextInfoView

package com.sulake.habbo.ui.widget.furniture.contextmenu
{
    import com.sulake.habbo.ui.widget.contextmenu.ButtonMenuView;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.ui.widget.contextmenu._SafeStr_3149;

    public class FurnitureContextInfoView extends ButtonMenuView 
    {

        protected var _SafeStr_3984:IRoomObject;
        protected var _SafeStr_4004:String;

        public function FurnitureContextInfoView(_arg_1:_SafeStr_3149)
        {
            super(_arg_1);
        }

        public static function setup(_arg_1:FurnitureContextInfoView, _arg_2:IRoomObject, _arg_3:String=""):void
        {
            _arg_1._SafeStr_3984 = _arg_2;
            _arg_1._SafeStr_4004 = _arg_3;
            setupContext(_arg_1);
        }


        protected function get roomObject():IRoomObject
        {
            return (_SafeStr_3984);
        }

        override public function dispose():void
        {
            _SafeStr_3984 = null;
            super.dispose();
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.contextmenu

// _SafeStr_3149 = "_-qk" (String#4158, DoABC#4)
// _SafeStr_3984 = "_-Ej" (String#1774, DoABC#4)
// _SafeStr_4004 = "_-41o" (String#1978, DoABC#4)


