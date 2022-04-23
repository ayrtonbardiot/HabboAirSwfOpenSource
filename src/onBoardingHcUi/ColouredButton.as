// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//onBoardingHcUi.ColouredButton

package onBoardingHcUi
{
    import flash.display.DisplayObject;
    import flash.display.Bitmap;
    import flash.geom.Rectangle;

    public class ColouredButton extends Button 
    {

        private static const button_green_png:Class = _SafeStr_59;
        private static const button_green_pressed_png:Class = _SafeStr_60;
        private static const button_green_inactive_png:Class = button_skin_green_inactive_png$9aa3bc7ee7a4de837d1c813355642cc3218752153;
        private static const button_green_rollover_png:Class = button_skin_green_rollover_png$306c18ba2ab3fcf3ecf17a2f5c1d1afb298114935;
        private static const button_red_png:Class = _SafeStr_61;
        private static const button_red_pressed_png:Class = _SafeStr_62;
        private static const button_red_rollover_png:Class = button_skin_pink_rollover_png$debf3adbd7e0417c92886d19a81e8b82973821998;
        private static const button_red_inactive_png:Class = button_skin_pink_inactive_png$17fe18eb1265c6d1d63bd9f34d3f90c4375153072;
        private static const button_yellow_png:Class = button_skin_yellow_png$b5818cebe7bbdd7c5404c8efd95b4b94463818734;
        private static const button_yellow_pressed_png:Class = _SafeStr_64;
        private static const button_yellow_rollover_png:Class = _SafeStr_65;
        private static const button_yellow_inactive_png:Class = _SafeStr_63;
        private static const icon_hc:Class = _SafeStr_83;
        public static const BUTTON_RED:String = "red";
        public static const BUTTON_GREEN:String = "gfreen";
        public static const BUTTON_YELLOW:String = "yellow";

        private var defaultBg:DisplayObject;
        private var pressedBg:DisplayObject;
        private var inactiveBg:DisplayObject;
        private var rolloverBg:DisplayObject;
        private var _icon:Bitmap;

        public function ColouredButton(_arg_1:String, _arg_2:String, _arg_3:Rectangle, _arg_4:Boolean, _arg_5:Function, _arg_6:uint=0xFFFFFF)
        {
            switch (_arg_1)
            {
                case "red":
                    defaultBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_red_png()).bitmapData, new Rectangle(8, 10, 6, 4));
                    pressedBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_red_pressed_png()).bitmapData, new Rectangle(8, 10, 6, 4));
                    inactiveBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_red_inactive_png()).bitmapData, new Rectangle(8, 10, 6, 4));
                    rolloverBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_red_rollover_png()).bitmapData, new Rectangle(8, 10, 6, 4));
                    break;
                case "gfreen":
                    defaultBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_green_png()).bitmapData, new Rectangle(8, 10, 6, 4));
                    pressedBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_green_pressed_png()).bitmapData, new Rectangle(8, 10, 6, 4));
                    inactiveBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_green_inactive_png()).bitmapData, new Rectangle(8, 10, 6, 4));
                    rolloverBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_green_rollover_png()).bitmapData, new Rectangle(8, 10, 6, 4));
                    break;
                case "yellow":
                    defaultBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_yellow_png()).bitmapData, new Rectangle(8, 10, 6, 4));
                    pressedBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_yellow_pressed_png()).bitmapData, new Rectangle(8, 10, 6, 4));
                    inactiveBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_yellow_inactive_png()).bitmapData, new Rectangle(8, 10, 6, 4));
                    rolloverBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_yellow_rollover_png()).bitmapData, new Rectangle(8, 10, 6, 4));
                    _icon = Bitmap(new icon_hc());
            };
            super(_arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
        }

        override protected function get defaultBackground():DisplayObject
        {
            return (defaultBg);
        }

        override protected function get pressedBackground():DisplayObject
        {
            return (pressedBg);
        }

        override protected function get inactiveBackground():DisplayObject
        {
            return (inactiveBg);
        }

        override protected function get rolloverBackground():DisplayObject
        {
            return (rolloverBg);
        }

        override protected function get etching():Boolean
        {
            return (false);
        }

        override protected function get padding():int
        {
            return (64);
        }

        override protected function get textColour():uint
        {
            return (0xFFFFFF);
        }

        override protected function get icon():Bitmap
        {
            return (_icon);
        }


    }
}//package onBoardingHcUi

// _SafeStr_59 = "button_skin_green_png$d3220c6b1db99cb1f483ec4b73e90311-1007244024" (String#3617, DoABC#3)
// _SafeStr_60 = "button_skin_green_pressed_png$cb062d8b07a9a45b05305e1f50769c7b-1919743358" (String#3618, DoABC#3)
// _SafeStr_61 = "button_skin_pink_png$5ac56a76c2af93d3e11dbdb94e3e12ae-283684056" (String#3621, DoABC#3)
// _SafeStr_62 = "button_skin_pink_pressed_png$f1a9705e9ca5c9bc8320beefef4a7580-1155022709" (String#3622, DoABC#3)
// _SafeStr_63 = "button_skin_yellow_inactive_png$b33dc692dc766bdc6060368f41263c22-27967694" (String#3624, DoABC#3)
// _SafeStr_64 = "button_skin_yellow_pressed_png$54241f25ebb2bf7423cbada32a855733-345662135" (String#3626, DoABC#3)
// _SafeStr_65 = "button_skin_yellow_rollover_png$3137e935a356571dec99bb9030cb614b-2113898584" (String#3627, DoABC#3)
// _SafeStr_83 = "hc_small_png$099323c663d9d6afe9041c5e2389cec7-303368016" (String#12267, DoABC#3)


