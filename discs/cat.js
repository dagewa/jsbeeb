define([], function () {
    "use strict";
    return function starCat() {
        return [
            { name: 'Elite', desc: 'An 8-bit classic. Hit F10 to launch from the space station, then use <, >, S, X and A to fly around.', file: 'elite.ssd' },
            { name: 'Welcome', desc: 'The disc supplied with BBC Disc systems to demonstrate some of the features of the system.', file: 'Welcome.ssd' },
            { name: 'Miss Hood', desc: 'Little Miss Power Hood. Navigate the maze while keeping away from the wolf!', file: 'MISSHOOD.SSD' },
            //{ name: 'Frogman', desc: 'A demo game developed by Matt Godbolt & Rich Talbot-Watkins that never made it.', file: 'frogman.ssd' }
        ];
    };
});
