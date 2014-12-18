"use strict";
describe('location.href Cleaner', function() {
  it('should ensure there are no HTTP Basic Auth credentials in `location.href`', function() {
    expect(location.href).not.toMatch(/monty/);
    expect(location.href).not.toMatch(/python/);
  });
});
