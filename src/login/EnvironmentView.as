// by nota

//login.EnvironmentView

package login
{
    import flash.display.Sprite;
    import com.sulake.core.runtime._SafeStr_13;
    import __AS3__.vec.Vector;
    import flash.display.Bitmap;
    import flash.text.TextField;
    import onBoardingHcUi.Button;
    import flash.utils.Timer;
    import flash.events.Event;
    import onBoardingHcUi.LoaderUI;
    import flash.events.TimerEvent;
    import onBoardingHcUi.ColouredButton;
    import flash.geom.Rectangle;
    import flash.display.DisplayObject;

    public class EnvironmentView extends Sprite implements _SafeStr_13 
    {

        private static const flag_icon_de_png:Class = flag_icons_de_png$e1dfd36a9f1338cbc2a7ee357cb64bb61345207035;
        private static const flag_icon_dev_png:Class = _SafeStr_81;
        private static const flag_icon_en_png:Class = flag_icons_en_png$5a69b9645cb0f0744c3ebf301445473d1847455379;
        private static const flag_icon_es_png:Class = flag_icons_es_png$c0a935b4597d5b6850bd64cb446bb6081839471400;
        private static const flag_icon_fi_png:Class = flag_icons_fi_png$3cfb63efefeeee578f910f482a5bdd101821117877;
        private static const flag_icon_fr_png:Class = flag_icons_fr_png$1ee8073b9f6b8e08f9284dd304e251ac1812912590;
        private static const flag_icon_it_png:Class = flag_icons_it_png$39b4989e683db55b40b7de2726d3804d1732612397;
        private static const flag_icon_nl_png:Class = flag_icons_nl_png$cfdcf06ba19353311f6604064dd14acf2136805432;
        private static const flag_icon_pt_png:Class = flag_icons_pt_png$a2fcc0627ea8e5f497120688f2da7e622071167734;
        private static const flag_icon_tr_png:Class = flag_icons_tr_png$f5addfb11e5bd5a06896b601e5051bd11948971384;
        private static const flag_icon_selected_png:Class = _SafeStr_82;
        private static const ITEMS_PER_ROW:int = 9;
        private static const THUMB_SIZE:int = 160;
        private static const THUMB_SCALE:Number = 0.5;
        private static const SPACING:int = 10;

        private var _SafeStr_9219:Vector.<Bitmap>;
        private var _context:LoginFlow;
        private var _SafeStr_9212:TextField;
        private var _SafeStr_9220:Bitmap;
        private var _environmentName:TextField;
        private var _SafeStr_9221:int = 0;
        private var _loginButton:Button;
        private var _loginWithCodeButton:Button;
        private var _environmentImageContainers:Array = [];
        private var _chosenIcon:Bitmap;
        private var _SafeStr_9213:int = 10;
        private var _SafeStr_9222:Array;
        private var _SafeStr_3853:Boolean;
        private var _SafeStr_9223:Sprite;

        public function EnvironmentView(_arg_1:LoginFlow)
        {
            _context = _arg_1;
            addEventListener("addedToStage", onAddedToStage);
        }

        private function onAddedToStage(_arg_1:Event):void
        {
            var _local_2:Timer = new Timer(20, 1);
            _local_2.addEventListener("timerComplete", onAlignElements);
            _local_2.start();
        }

        private function onAlignElements(_arg_1:TimerEvent=null):void
        {
            LoaderUI.alignAnchors(this, 0, "c", _SafeStr_9220);
            if (_loginButton)
            {
                LoaderUI.alignAnchors(_SafeStr_9220, 0, "r", _loginButton);
                LoaderUI.lineUpHorizontallyRevers(_loginButton, 20, _loginWithCodeButton);
            }
            else
            {
                LoaderUI.alignAnchors(_SafeStr_9220, 0, "r", _loginWithCodeButton);
            };
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_loginButton)
            {
                _loginButton.dispose();
            };
            _loginWithCodeButton.dispose();
            for each (var _local_1:Bitmap in _SafeStr_9219)
            {
            };
            _SafeStr_9219 = null;
            _context = null;
        }

        public function get disposed():Boolean
        {
            return (_context == null);
        }

        private function initEnvironmentImages():void
        {
            _SafeStr_9222 = _context.getProperty("live.environment.list").split("/");
            _SafeStr_9219.push(Bitmap(new flag_icon_en_png()));
            _SafeStr_9219.push(Bitmap(new flag_icon_pt_png()));
            _SafeStr_9219.push(Bitmap(new flag_icon_de_png()));
            _SafeStr_9219.push(Bitmap(new flag_icon_es_png()));
            _SafeStr_9219.push(Bitmap(new flag_icon_fi_png()));
            _SafeStr_9219.push(Bitmap(new flag_icon_fr_png()));
            _SafeStr_9219.push(Bitmap(new flag_icon_it_png()));
            _SafeStr_9219.push(Bitmap(new flag_icon_nl_png()));
            _SafeStr_9219.push(Bitmap(new flag_icon_tr_png()));
            _SafeStr_9219.push(Bitmap(new flag_icon_dev_png()));
        }

        public function init():void
        {
            if (_SafeStr_3853)
            {
                return;
            };
            _SafeStr_3853 = true;
            _SafeStr_9219 = new Vector.<Bitmap>();
            if (_SafeStr_9222 == null)
            {
                initEnvironmentImages();
            };
            updateEnvironment();
            initView();
        }

        public function updateEnvironment():void
        {
            var _local_1:String = _context.getProperty("environment.id");
            var _local_2:int = _SafeStr_9222.indexOf(_local_1);
            if (_local_2 == -1)
            {
                _SafeStr_14.log(("Missing environment, require hotel selection! " + _local_1));
                _SafeStr_9221 = 0;
            }
            else
            {
                _SafeStr_9221 = _local_2;
            };
            chooseEnvironment();
        }

        public function initView():void
        {
            var _local_7:int;
            var _local_8:* = null;
            var _local_10:* = null;
            var _local_3:int;
            var _local_2:int;
            var _local_6:int;
            var _local_9:int;
            var _local_4:int;
            var _local_5:int;
            addTitleField();
            _SafeStr_9220 = LoaderUI.createBalloon(640, 100, 0, false, 995918, "none");
            _SafeStr_9220.visible = false;
            addChild(_SafeStr_9220);
            _SafeStr_9223 = new Sprite();
            addChild(_SafeStr_9223);
            _chosenIcon = Bitmap(new flag_icon_selected_png());
            _SafeStr_9223.addChild(_chosenIcon);
            var _local_11:* = 0.5;
            _SafeStr_9223.scaleY = _local_11;
            _SafeStr_9223.scaleX = _local_11;
            var _local_1:int = 100;
            _local_7 = 0;
            while (_local_7 < _SafeStr_9219.length)
            {
                _local_8 = new Sprite();
                _local_10 = (_SafeStr_9219[_local_7] as Bitmap);
                if (_local_10 != null)
                {
                    _local_8.addChild(_local_10);
                };
                addChild(_local_8);
                _environmentImageContainers.push(_local_8);
                _local_8.name = _local_7;
                _local_8.addEventListener("click", onEnvironmentClick);
                _local_11 = 0.5;
                _local_8.scaleY = _local_11;
                _local_8.scaleX = _local_11;
                _local_3 = 80;
                _local_2 = 5;
                _local_6 = (_local_7 % 9);
                _local_9 = int((_local_7 / 9));
                _local_4 = ((_local_6 * _local_3) + (_local_6 * _local_2));
                _local_5 = ((_local_9 * _local_3) + (_local_9 * _local_2));
                _local_8.x = _local_4;
                _local_8.y = (_local_1 + _local_5);
                _local_7++;
            };
            _environmentName = LoaderUI.createTextField("Title", 20, 0xFFFFFF, false, true, false, false);
            _environmentName.width = 260;
            _environmentName.y = 300;
            addChild(_environmentName);
            _loginWithCodeButton = new ColouredButton("gfreen", "${connection.login.useTicket}", new Rectangle(0, 300, 0, 40), true, onButtonSelectToken);
            addChild(_loginWithCodeButton);
            chooseEnvironment();
        }

        private function addTitleField():void
        {
            if (!_SafeStr_9212)
            {
                _SafeStr_9212 = LoaderUI.createTextField("${connection.login.environment.choose}", 40, 0xFFFFFF, false, true, false, false, "left");
                _SafeStr_9212.x = 0;
                _SafeStr_9212.y = 0;
                _SafeStr_9212.width = 500;
                _SafeStr_9212.multiline = false;
                _SafeStr_9212.thickness = 50;
                addChild(_SafeStr_9212);
            };
        }

        private function onEnvironmentClick(_arg_1:Event):void
        {
            _SafeStr_9221 = _arg_1.currentTarget.name;
            chooseEnvironment();
            _context.updateEnvironment(_SafeStr_9222[_SafeStr_9221], true);
            onAlignElements();
        }

        private function chooseEnvironment():void
        {
            var _local_1:Sprite = _environmentImageContainers[_SafeStr_9221];
            if (_local_1 == null)
            {
                return;
            };
            _SafeStr_9223.x = ((_local_1.x - ((_SafeStr_9223.width - _local_1.width) / 2)) - 1);
            _SafeStr_9223.y = ((_local_1.y - ((_SafeStr_9223.height - _local_1.height) / 2)) - 1);
            _SafeStr_9223.visible = true;
            if (_loginButton)
            {
                _loginButton.active = true;
            };
            updateDescription();
        }

        private function onButtonSelect(_arg_1:DisplayObject):void
        {
            _context.updateEnvironment(_SafeStr_9222[_SafeStr_9221], false);
            _context.showScreen(2);
        }

        private function onButtonSelectToken(_arg_1:DisplayObject):void
        {
            _context.updateEnvironment(_SafeStr_9222[_SafeStr_9221], false);
            _context.showScreen(4);
        }

        private function updateDescription():void
        {
            var _local_1:String = _SafeStr_9222[_SafeStr_9221];
            _environmentName.text = _context.getProperty(("connection.info.name." + _local_1));
        }

        public function get environmentId():String
        {
            return (_SafeStr_9222[_SafeStr_9221]);
        }

        public function get environmentAvailable():Boolean
        {
            var _local_1:String = _context.getProperty("environment.id");
            return (_SafeStr_9222.indexOf(_local_1) > -1);
        }


    }
}//package login

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_3853 = "_-T1w" (String#8500, DoABC#3)
// _SafeStr_81 = "flag_icons_dev_png$19533dbb6a78b96776a27df4e49fdb90-1695405575" (String#3781, DoABC#3)
// _SafeStr_82 = "flags_icon_selected_png$a0861cc392bae9b5094f12eddaeaca9a-60902293" (String#4189, DoABC#3)
// _SafeStr_9212 = "_-wE" (String#10476, DoABC#3)
// _SafeStr_9213 = "_-h1j" (String#9479, DoABC#3)
// _SafeStr_9219 = "_-AS" (String#7284, DoABC#3)
// _SafeStr_9220 = "_-j1r" (String#9610, DoABC#3)
// _SafeStr_9221 = "_-fn" (String#9375, DoABC#3)
// _SafeStr_9222 = "_-wO" (String#10479, DoABC#3)
// _SafeStr_9223 = "_-Km" (String#7922, DoABC#3)


