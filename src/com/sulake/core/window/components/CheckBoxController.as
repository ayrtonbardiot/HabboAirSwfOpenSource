// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.components.CheckBoxController

package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.events._SafeStr_3116;

    public class CheckBoxController extends SelectableController implements _SafeStr_3158 
    {

        protected static const TEXT_FIELD_NAME:String = "_CAPTION_TEXT";

        public function CheckBoxController(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:_SafeStr_3109, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        override public function set caption(_arg_1:String):void
        {
            super.caption = _arg_1;
            var _local_2:_SafeStr_3109 = getChildByName("_CAPTION_TEXT");
            if (_local_2 != null)
            {
                _local_2.caption = caption;
            };
        }

        override public function update(_arg_1:WindowController, _arg_2:_SafeStr_3116):Boolean
        {
            if (_arg_1 == this)
            {
                switch (_arg_2.type)
                {
                    case "WME_UP":
                        if (isSelected)
                        {
                            unselect();
                        }
                        else
                        {
                            select();
                        };
                };
            };
            return (super.update(_arg_1, _arg_2));
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)


